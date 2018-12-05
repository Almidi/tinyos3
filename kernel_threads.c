
#include "tinyos.h"
#include "kernel_sched.h"
#include "kernel_proc.h"
//VDK Edit
//We include that file to use kernel functions
#include "kernel_cc.h"

//VDK Edit
/* The memory allocated for the PTCB must be a multiple of SYSTEM_PAGE_SIZE */
#define THREAD_PTCB_SIZE   (((sizeof(PTCB)+SYSTEM_PAGE_SIZE-1)/SYSTEM_PAGE_SIZE)*SYSTEM_PAGE_SIZE)

/* This is specific to Intel Pentium! */
#define SYSTEM_PAGE_SIZE  (1<<12)

//#define MMAPPED_THREAD_MEM
#ifdef MMAPPED_THREAD_MEM

/*
  Use mmap to allocate a thread. A more detailed implementation can allocate a
  "sentinel page", and change access to PROT_NONE, so that a stack overflow
  is detected as seg.fault.
 */
void free_PTCB(void* ptr, size_t size)
{
  CHECK(munmap(ptr, size));
}

void* allocate_PTCB(size_t size)
{
  void* ptr = mmap(NULL, size,
      PROT_READ|PROT_WRITE|PROT_EXEC,
      MAP_ANONYMOUS  | MAP_PRIVATE
      , -1,0);

  CHECK((ptr==MAP_FAILED)?-1:0);

  return ptr;
}
#else
/*
  Use malloc to allocate a thread. This is probably faster than  mmap, but cannot
  be made easily to 'detect' stack overflow.
 */
void free_PTCB(void* ptr, size_t size)
{
	free(ptr);
}

void* allocate_PTCB(size_t size)
{
	void* ptr = aligned_alloc(SYSTEM_PAGE_SIZE, size);
	CHECK((ptr==NULL)?-1:0);
	return ptr;
}
#endif


//TODO Is this correct/optimal ?
Tid_t get_tid(TCB* tcb)
{
    return (tcb == NULL ? NOTHREAD : tcb);
}


/**
  @Function for created threads (not main threads)
  */
void start_thread()
{
    PTCB* cur_ptcb = CURTHREAD->owner_ptcb;
    int exitval;
    Task call = cur_ptcb->task;
    int argl = cur_ptcb->argl;
    void* args = cur_ptcb->args;
    exitval = call(argl,args);
    assert(cur_ptcb != NULL);
    ThreadExit(exitval);
}

/** 
  @brief Create a new thread in the current process.
  */
Tid_t sys_CreateThread(Task task, int argl, void* args)
{
//	VDK Edit
	/* Inherit parent */
	PCB * curproc = CURPROC;

	/* Create New PTCB. The allocated TCB size must be a multiple of page size*/
	PTCB* ptcb = (PTCB*) allocate_PTCB(THREAD_PTCB_SIZE);

    /*Init*/
    ptcb->owner_pcb = curproc;
    ptcb->task = task;
    ptcb->argl = argl;
    ptcb->args = args;
    ptcb->refCount = 0;
    ptcb->isDetached = 0;
    ptcb->isExited = 0;
    ptcb->cVar = COND_INIT;

    //Add PTCB To PCB
    rlnode_init(& ptcb->node, ptcb);  /* Intrusive list node */
    rlist_push_back(& curproc->ptcb_list, & ptcb->node);

    ptcb->tid = (Tid_t) ptcb; //Get TID of thread

    //we test the unlike scenario that task != NULL
    if(task != NULL){
      CURPROC->ptcb_counter++;
      ptcb->thread = spawn_thread(curproc, start_thread);
      ptcb->thread->owner_ptcb = ptcb;
      wakeup(ptcb->thread); //Wake up the thread
    }
    
    
    return ptcb->tid;
}

/**
  @brief Return the Tid of the current thread.
 */
Tid_t sys_ThreadSelf()
{
  /**We defined and used Tid inside ptcb. So we also needed to change ThreadSelf.
  In order to find Tid we must return its pointer to ptcb from tcb */
  return (Tid_t)(CURTHREAD->owner_ptcb);
}

/**
  @brief Join the given thread.
  */
int sys_ThreadJoin(Tid_t tid, int* exitval)
{
  //Find ptcb from the tid
  PTCB* ptcb = (PTCB*)tid;

  //Check list if there is valid tid
  if(rlist_find(&CURPROC->ptcb_list,ptcb, NULL)!=NULL){

    /**Now we need to check for all the cases
        1.Check for exited status
        2.Check for detached status
        3.Check that it is not itself
    */
    if( tid == sys_ThreadSelf() || ptcb->isDetached ){
      //case the procedure is unsuccessful return -1
      return -1;

    }else{
      //When enters jointhread increase refCount
      ptcb->refCount++;

      //Join work is the thread of the given TID is not exited and detached
      while(ptcb->isExited == 0 && ptcb->isDetached == 0){
        kernel_wait(&ptcb->cVar, SCHED_USER);
      }

      //When kernel wait finishes thread is at detached or exited state and we reduce refCount to kill it afterwards
      ptcb->refCount--;

      //We need to check that exitval has different value from NULL(NOPROC)
      if(exitval!=NULL){
        *exitval = ptcb -> exitval;
      }

      //Already exited
      if (ptcb->refCount <= 0)
      {
        rlist_remove(&ptcb->node);
        free(ptcb);
      }
    }
    
  }
  //case the procedure is successful return 0
  return 0;
}

/**
  @brief Detach the given thread.
  */
int sys_ThreadDetach(Tid_t tid)
{
  //Find ptcb from the tid
  PTCB* ptcb = (PTCB*)tid;

  /**We must initially check that given Tid belongs to CURPROC
  so we scan the entire rlnode list. We must also check that thread is not exited*/
  if(rlist_find(& CURPROC->ptcb_list, ptcb, NULL) != NULL && !ptcb->isExited){

    ptcb->isDetached = 1; //Change detach flag state to 1(true)
    kernel_broadcast(& ptcb->cVar); //Broadcast cVar of ptcb
    return 0;
  }
  return -1;
  
}

/**
  @brief Terminate the current thread.
  */
void sys_ThreadExit(int exitval)
{
    PTCB* cur_ptcb = CURTHREAD->owner_ptcb;
    cur_ptcb->isExited = 1; //Exited flag to true
    cur_ptcb->exitval = exitval;
    //VDK EDIT PHASE 2
    CURPROC->thread_count--;

    kernel_broadcast(&cur_ptcb->cVar);  //Broadcast all the threads that are sleeping in this thread's cVar

    //There is a case where the thread will not attempt to join so we must free it afterwards
    if (cur_ptcb->refCount <= 0)
      {
        rlist_remove(&cur_ptcb->node);
        free(cur_ptcb);
      }

    //Decrease thread number
    CURPROC->ptcb_counter--;

    //In case we find the last ptcb clean up everything
    if(CURPROC->ptcb_counter == 0){
      while(! is_rlist_empty(& (CURPROC->ptcb_list))){
        rlnode* tmp = rlist_pop_front(&(CURPROC->ptcb_list));
        free(tmp->ptcb);
      }
    }

    kernel_sleep(EXITED, SCHED_USER); //Kill the thread



}


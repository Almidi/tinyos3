
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
    return tcb==NULL ? NOTHREAD : tcb;
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

    //ptcb->thread = spawn_thread(curproc, start_thread);
//    Get TID of thread

//    Wake the thread
    
    ptcb->thread = spawn_thread(curproc, start_thread);
    ptcb->tid = (Tid_t) ptcb;
    ptcb->thread->owner_ptcb = ptcb;
    wakeup(ptcb->thread);
    
    return ptcb->tid;
}

/**
  @brief Return the Tid of the current thread.
 */
Tid_t sys_ThreadSelf()
{
  //TODO ask about that
	//return (Tid_t) CURTHREAD;
  return (Tid_t)(CURTHREAD->owner_ptcb);
}

/**
  @brief Join the given thread.
  */
int sys_ThreadJoin(Tid_t tid, int* exitval)
{
  PTCB* ptcb = (PTCB*)tid;

  //Check list if there is valid tid
  if(rlist_find(&CURPROC->ptcb_list,ptcb, NULL)!=NULL){

    /**Now we need to check for all the cases
        1.Check for exited status
        2.Check for detached status
        3.Check that it is n
        TODO finish with the comments
    */
    if( tid == sys_ThreadSelf() && ptcb->isDetached ){
      return -1;
    }else{
      ptcb->refCount++;

      while(ptcb->isExited == 0 && ptcb->isDetached == 0){
        kernel_wait(&ptcb->cVar, SCHED_USER);
      }

      if(exitval!=NULL){
        *exitval = ptcb -> exitval;
      }
      //Already exited
      if (ptcb->refCount == 1)
      {
        rlist_remove(&ptcb->node);
        free(ptcb);
      }
    }
    

  }
  return 0;
}

/**
  @brief Detach the given thread.
  */
int sys_ThreadDetach(Tid_t tid)
{
  PTCB* ptcb = (PTCB*)tid;

  //TODO write some comments
  if(rlist_find(& CURPROC->ptcb_list, ptcb, NULL) != NULL){

    if(ptcb->isExited){
      return -1;
    }
    ptcb->isDetached = 1;
    kernel_broadcast(& ptcb->cVar);
    return 0;
  }
  return -1;
  
}

/**
  @brief Terminate the current thread.
  */
void sys_ThreadExit(int exitval)
{
  //TODO fix
    PTCB* cur_ptcb = CURTHREAD->owner_ptcb;
    cur_ptcb->isExited = 1;
    cur_ptcb->exitval = exitval;

    kernel_broadcast(&cur_ptcb->cVar);

    kernel_sleep(EXITED, SCHED_USER);

}


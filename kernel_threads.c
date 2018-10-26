
#include "tinyos.h"
#include "kernel_sched.h"
#include "kernel_proc.h"

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
void start_thread(Task call, int argl, void* args)
{
    int exitval;
    exitval = call(argl,args);
    Exit(exitval);
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

    ptcb->thread = spawn_thread(curproc, start_thread);
//    Get TID of thread
    ptcb->tid = get_tid(ptcb->thread);
//    Wake the thread
    wakeup(ptcb->thread);
    return ptcb->tid;
}

/**
  @brief Return the Tid of the current thread.
 */
Tid_t sys_ThreadSelf()
{
	return (Tid_t) CURTHREAD;
}

/**
  @brief Join the given thread.
  */
int sys_ThreadJoin(Tid_t tid, int* exitval)
{
	return -1;
}

/**
  @brief Detach the given thread.
  */
int sys_ThreadDetach(Tid_t tid)
{
	return -1;
}

/**
  @brief Terminate the current thread.
  */
void sys_ThreadExit(int exitval)
{

}


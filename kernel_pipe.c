
#include "tinyos.h"

/** Include needed files to make things work*/
#include "kernel_streams.h"	//This contains fcb
#include <kernel_cc.h>	//This is for kernel calls




/******************************READER OPS************************/
/**Writer to specific size buffer, to the stream this. In that case we
	are refering to pipes*/
int pipe_read(void* this, char *buf, unsigned int size){

	PIPCB* pipcb = (PIPCB *)this;

	/*In case our reader is closed return -1*/
	if(pipcb->readerClosedFlag){
		return -1;
	}

	if(pipcb->elementcounter == 0 && pipcb->writerClosedFlag){
		//if(pipcb->readerPos == pipcb->writerPos && pipcb->writerClosedFlag){
			//return bufParser;
			return 0;
		}
	
	uint bufParser;

	for(bufParser = 0; bufParser < size ; bufParser ++){
		//TODO
		if(pipcb->elementcounter == 0 && pipcb->writerClosedFlag){
		//if(pipcb->readerPos == pipcb->writerPos && pipcb->writerClosedFlag){
			//return bufParser;
			return bufParser;
		}

		//case full broadcast etc
		while(pipcb->elementcounter == 0 && pipcb->readerClosedFlag==0 && pipcb->writerClosedFlag==0){
		//while(pipcb->readerPos == pipcb->writerPos  && !pipcb->readerClosedFlag && !pipcb->writerClosedFlag){

			kernel_broadcast(& pipcb->fullCase);
  			kernel_wait(& pipcb->emptyCase,SCHED_PIPE);
		}

		// if(pipcb->elementcounter == 0 && pipcb->writerClosedFlag){
		// //if(pipcb->readerPos == pipcb->writerPos && pipcb->writerClosedFlag){
		// 	return bufParser;
		// }

		//TODO CHECK
		/*When awake check if writer or reader is closed*/
		if(pipcb->readerClosedFlag){
			return bufParser;
		}

		if(pipcb->elementcounter >0){
		//if(pipcb->readerPos < pipcb->writerPos){
			pipcb->readerPos++;
			if(pipcb->readerPos >= BUFFER_SIZE){
				pipcb->readerPos = 0;

			}
			buf[bufParser] = pipcb->buffer[pipcb->readerPos];
			pipcb->elementcounter--;
		}
		

	}

	kernel_broadcast(&pipcb->fullCase);
	return bufParser;
	
}



/** Just for plentitude reasons, assign in reader buffer write function
to return -1*/
int N_pipe_write(void* this, const char* buf, unsigned int size){
	return -1;
}

int pipe_reader_close(void* this){
	
	PIPCB* pipcb = (PIPCB *)this;

	//TODO ask
	/*In case somehow, it tries to reclose*/
	if (pipcb->readerClosedFlag == 1){
		return 0;
	}

	pipcb->readerClosedFlag = 1;
	kernel_broadcast(&pipcb->emptyCase);

	/**If both streams are closed then free both*/
	if(pipcb->writerClosedFlag == 1){
		free(pipcb);
	}

	/*if everything goes as planned return success*/
	return 0;
}


/******************************WRITER OPS*************************/


int pipe_write(void* this, const char* buf, unsigned int size){

	PIPCB* pipcb = (PIPCB *)this;


	/* In case writer is closed return -1. Also if reader is close d
	you must not write as nobody will be there to read*/
	if(pipcb->writerClosedFlag || pipcb->readerClosedFlag){
		return -1;
	}

	uint bufParser;

	for(bufParser = 0; bufParser < size ; bufParser ++){

		//case full broadcast etc
		//while(pipcb->writerPos == BUFFER_SIZE && !pipcb->readerClosedFlag && !pipcb->writerClosedFlag){
		while(pipcb->elementcounter == BUFFER_SIZE && pipcb->readerClosedFlag==0){
			kernel_broadcast(& pipcb->emptyCase);
  			kernel_wait(& pipcb->fullCase,SCHED_PIPE);
		}

		
		/*When reader closed return -1*/
		if(pipcb->readerClosedFlag){
			return -1;
		}

		/*When writer closed return buf size*/
		if(pipcb->writerClosedFlag){
			return bufParser;
		}

		
		pipcb->writerPos++;
		if(pipcb->writerPos >= BUFFER_SIZE){
			pipcb->writerPos = 0;

		}
		pipcb->buffer[pipcb->writerPos] = buf[bufParser];
		pipcb->elementcounter++;

	}

	/**broadcast emptyCase(reader) that wait to read */
	kernel_broadcast(&pipcb->emptyCase);
	return bufParser;
}



/** Just for plentitude reasons, assign in writer buffer read function
to return -1*/
int N_pipe_read(void* this, char *buf, unsigned int size){	
	return -1;
}

/**StreamObject for this*/
int pipe_writer_close(void* this){

	PIPCB* pipcb = (PIPCB *)this;

	//TODO ask
	/*In case somehow, it tries to reclose*/
	if (pipcb->writerClosedFlag == 1){
		return 0;
	}

	pipcb->writerClosedFlag = 1;
	kernel_broadcast(&pipcb->fullCase);

	/**If both streams are closed then free both*/
	if(pipcb->readerClosedFlag == 1){
		free(pipcb);
	}

	/*if everything goes as planned return success*/
	return 0;
}

/***************************FILE OPS USED(STATIC)****************************/
/**
	File ops are defined in kernel_dev.h. We initially had to 
	assign static values to reader and writer to define which
	file ops are used or not(NULL value for unused) in each stream
	Similar definition at kernel_dev.c
*/
static file_ops reader_ops = {
  .Open = NULL,	//TODO check if NULL or if need to assign value OR -1 ASSIGN
  .Read = pipe_read,
  .Write = N_pipe_write,
  .Close = pipe_reader_close
};

static file_ops writer_ops = {
  .Open = NULL,//TODO check if NULL or if need to assign value
  .Read = N_pipe_read,
  .Write = pipe_write,
  .Close = pipe_writer_close
};

PIPCB* pipe_Init(FCB** fcb)
{
	/**Allocate memory for our pipe control block*/
	PIPCB *pipcb = (PIPCB *)xmalloc(sizeof(PIPCB));

	/** Initialiaze everything from pipe_control_block*/
	pipcb->readerPos = 0;
	pipcb->writerPos = 0;
	pipcb->fullCase = COND_INIT;
	pipcb->emptyCase = COND_INIT;
	pipcb->readerClosedFlag = 0;
	pipcb->writerClosedFlag = 0;
	pipcb->elementcounter = 0;
	//---------------------------- Do we need to initialize the buffer?????? ------------------------------------------
	pipcb->readerFCB = fcb[0];
	pipcb->writerFCB = fcb[1];	/**INITIALIAZED THE VARIABLES BUT MAYBE THEY ARE NOT USED*/

	return pipcb;
}



/**************************INITIALITATION AND SYSCALL*********************/
/**Syscall for pipes
Found in tinyos.h
Return 0 on success, -1 on error
*/
int sys_Pipe(pipe_t* pipe)
{
	/**Two arrays for reader and writer*/
	Fid_t fidPipe[2];
	FCB *FCBpipe[2];

	/**
		Check if we can reserve two FCB positions for
		reader and writer consecutevely. If reserve fails
		return -1 and terminate.
	*/

	if(!FCB_reserve(2, fidPipe, FCBpipe)){
		return -1;
	}

	/**
		Also defined in tinyos.h takes tid as parameter.
		Assign first fid to reader and second to writer
	*/

	//call the function responsible for pipe cb initialization
	PIPCB* pipcb = pipe_Init(FCBpipe);
	pipe->read = fidPipe[0];
	pipe->write = fidPipe[1];

	
	/*Make first reader and second writer*/
	FCBpipe[0]->streamobj = pipcb;
	FCBpipe[1]->streamobj = pipcb;

	FCBpipe[0]->streamfunc = &reader_ops;
	FCBpipe[1]->streamfunc = &writer_ops;

	return 0;
}


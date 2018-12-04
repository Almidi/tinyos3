/*****************************PIPE CONTROL BLOCK******************************/

typedef struct Pipe_Control_Block
{
	char buffer[BUFFER_SIZE];	/** Our buffer*/

	int readerPos;	//We need to keep variables about reader and writer position
	int writerPos;

	FCB *readerFCB, *writerFCB;	/**TODO ask where they are used*/

	CondVar fullCase;
	CondVar emptyCase;	/**We need to check whether the buffer
						is empty which can cause problem in read(send signal in read)
						or whether the buffer is full where can cause problem in write
						(signal read).
						*/
	
	int readerClosedFlag;
	int writerClosedFlag;	/**MUST KNOW IF READER/WRITER IS CLOSED*/

	int elementcounter;	/**We should count the elements of the buffer so that we know if 
							the buffer is empty or full */
}PIPCB;
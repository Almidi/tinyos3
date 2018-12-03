
#include "tinyos.h"
#include "kernel_streams.h"
#include "kernel_cc.h"


int socket_read(void* socket, char* buf, unsigned int size);
int socket_write(void* socket, const char* buf, unsigned int size);
int socket_close(void* socket);

int socket_counter = 0;


// the socket operations
static file_ops socket_ops = {
  .Open = NULL,
  .Read = socket_read,
  .Write = socket_write,
  .Close = socket_close
};



Fid_t sys_Socket(port_t port)
{
  //we want 1 fcb and 1 fid
  Fid_t fid[1];
  FCB* fcb[1];

  //initialize the ports table only once (when there are no sockets created)
  if(socket_counter == 0)
  	initialize_port_map(PORT_MAP);

  //check for illegal port number
  if(port> 0 && port <= MAX_PORT){

  	//create a new socket control block
  	SCB* scb = (SCB* ) xmalloc(sizeof(SCB));

  	//check if the available file ids for the process are exhausted
  	if(! FCB_reserve(1, &fid, &fcb))
		return NOFILE;

	//-----------------------initialize the scb--------------------------
	scb->ref_count = 0;
	scb->fcb = fcb[0];
	scb->fid = fid[0];
	//bound the socket to the specified port
	scb->port = port;
	scb->sock_type = UNBOUND;

	//stream functions are the socket operations
	fcb[0]->streamfunc = &socket_ops;
	// stream object is the socket control block
	fcb[0]->streamobj = scb;
  	socket_counter++;

  	//return a file id for the new socket
  	return fid[0];		
  }
  else
  	return NOFILE;
}
  



int sys_Listen(Fid_t sock)
{
	return -1;
}


Fid_t sys_Accept(Fid_t lsock)
{
	return NOFILE;
}


int sys_Connect(Fid_t sock, port_t port, timeout_t timeout)
{
	return -1;
}


int sys_ShutDown(Fid_t sock, shutdown_mode how)
{
	return -1;
}



#include "tinyos.h"
#include "util.h"
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
  	if(! FCB_reserve(1, fid, fcb))
		return NOFILE;

	//-----------------------initialize the scb--------------------------
	scb->ref_counter = 0;
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



int socket_read(void* socket, char* buf, unsigned int size)
{
	SCB* scb = (SCB* ) socket;
	//the number of data that was read
	int num_of_data = 0;

	//Only peer sockets can read data
	if(scb->sock_type == PEER){
		//use the pipe responsible for reading data
		num_of_data = pipe_read(scb->peer_sock.pipe_receiver, buf, size);
		return num_of_data;
	}
	else
		return -1;
}


int socket_write(void* socket, const char* buf, unsigned int size)
{
	SCB* scb = (SCB* ) socket;
	//the number of data that was written
	int num_of_data = 0;

	//Only peer sockets can write data
	if(scb->sock_type == PEER){
		//use the pipe responsible for writing data
		num_of_data = pipe_write(scb->peer_sock.pipe_sender, buf, size);
		return num_of_data;
	}
	else
		return -1;
}


int socket_close(void* socket)
{
	SCB* scb = (SCB*) socket;
	//check if the socket we are trying to close is NULL
	if(scb == NULL)
		return -1;

	if(scb->sock_type == PEER){

		//check if this peer socket is connected to another socket 
		if(scb->peer_sock.socket_pointer != NULL){
			//close the pipe responsible for writing data
			pipe_writer_close(scb->peer_sock.pipe_sender);
			//close the pipe responsible for reading data
			pipe_reader_close(scb->peer_sock.pipe_receiver);
			//decrease the reference counter of this socket
			scb->ref_counter--;
			//destroy the peer to peer connection  (????)
			scb->peer_sock.socket_pointer->peer_sock.socket_pointer = NULL;
		}
	}
	else if(scb->sock_type == LISTENER){
		//transform the socket from LISTENER to UNBOUND
		PORT_MAP[scb->port] = NULL;
		//decrease the reference counter of this socket
		scb->ref_counter--;
		//--------------------------------------------------------------- TO CHECK ---------------------------
		//wake up the listener to serve the remaining requests
		kernel_signal(&scb->listener_sock.cv_request);
		//while the queue that holds the requests is not empty
		while(!is_rlist_empty(&scb->listener_sock.requestQueue)){
			//dequeue a request from the head
			rlnode* request = rlist_pop_front(&scb->listener_sock.requestQueue);
			//--------------------------------------------------------------- TO CHECK ---------------------------
			//wake up the request that was sleeping, waiting for a LISTENER  to serve it
			kernel_signal(&request->req->cv);
		}
	}
	/* If it is an UNBOUND socket, the only thing we need to do is 
 		to check for its reference counter and free it. */

	//only if no sockets observe this socket, we can free its control block
	if(scb->ref_counter == 0)
		free(scb);

	return 0;

}
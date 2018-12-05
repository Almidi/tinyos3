
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
  if(port >= 0 && port <= MAX_PORT)
  {	

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
	Fid_t fid = sock;
	//Only values 0 to MAX_FILEID-1 are legal for file descriptors.
	if(fid < 0 || fid >= MAX_FILEID)
		return -1;

	//get the fcb from the fid
	FCB* fcb = get_fcb(fid);

	if(fcb == NULL)
		return -1;

	SCB* scb = fcb->streamobj;

	if(scb == NULL)
		return -1;

	//check if the socket is bound to a valid port
	if(scb->port > 0 && scb->port < MAX_PORT){
		//check if the socket isn't already a LISTENER or a PEER 
		if(scb->sock_type == UNBOUND){
			//check if another LISTENER is already bound to this port 
			if(PORT_MAP[scb->port] == NULL){

				//Transform the socket to LISTENER at this port
				PORT_MAP[scb->port] = scb;
				scb->sock_type = LISTENER;
				scb->ref_counter++;
				//Initialize the cv of the LISTENER
				scb->listener_sock.cv_request = COND_INIT;
				//initialize the request queue of the LISTENER
				rlnode_init(&scb->listener_sock.requestQueue, NULL);
				//rlnode_init(&scb->listener_sock.requestQueue, scb->listener_sock);
				return 0;
			}
			else return -1;
		}
		else return -1;
	}
	else return -1;	
	
}





Fid_t sys_Accept(Fid_t lsock)
{
	return NOFILE;
}




int sys_Connect(Fid_t sock, port_t port, timeout_t timeout)
{
	Fid_t fid = sock;
	//Only values 0 to MAX_FILEID-1 are legal for file descriptors.
	if(fid < 0 || fid >= MAX_FILEID)
		return -1;

	//get the fcb of the socket trying to connect to the LISTENER from the fid
	FCB* fcb = get_fcb(fid);

	if(fcb == NULL)
		return -1;

	//get the socket that tries to connect to the LISTENER from the stream object of the fcb
	SCB* scb = fcb->streamobj;

	if(scb == NULL)
		return -1;

	//check if the port we are trying to connect to is valid
	if(port > 0 && port < MAX_PORT){

		//1. Only UNBOUND Sockets can connect to LISTENERS 
		//2. Check if there is a LISTENER bound on the port we want to establish a connection
		if(scb->sock_type == !UNBOUND || PORT_MAP[port] == NULL)
			return -1;

		//get the control block of the LISTENER from the port in the ports Table
		SCB* listener_scb = PORT_MAP[port];
		//create a queue of requests
		queue_request* request = (queue_request* ) xmalloc(sizeof(queue_request));
		//Initialize the control block of the queue holding the requests
		request->scb = listener_scb;
		request->cv  = COND_INIT;
		request->request_flag = 0;
		rlnode_init(&request->req_queue, request);
		//insert the new request in the LISTENER's request queue
		rlist_push_back(&listener_scb->listener_sock.requestQueue, &request->req_queue);
		listener_scb->ref_counter++;

		//wake up the listener to serve the new request
		kernel_signal(&listener_scb->listener_sock.cv_request);

		/*The new request is sleeping until either it is served by the LISTENER or 
		  the timeout has expired. In this case, the connection has failed. 

		  kernel_timedwait returns 1 for success by signal/broadcast or 0 for failure */
		int timed_out = kernel_timedwait(&request->cv, SCHED_USER, timeout);
		//remove the request from the queue because it was served by the LISTENER (either failed or succeeded)
		rlist_remove(&request->req_queue);
		listener_scb->ref_counter--;

		//check if connection has failed due to timeout expiration
		if(timed_out == 1)
			return -1;
		//check if the connection has succeeded
		if(request->request_flag == 1)
			return 0;
		else
			return -1;
	}
	else return -1;
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
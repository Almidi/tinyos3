
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
	if(fid < 0 || fid > MAX_FILEID)
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
	Fid_t listener_fid = lsock;

	//Only values 0 to MAX_FILEID-1 are legal for file descriptors.
	if(listener_fid < 0 || listener_fid >= MAX_FILEID){
		return NOFILE;		
	}

	//get the fcb from the listener_fid
	FCB* listener_fcb = get_fcb(listener_fid);

	if(listener_fcb == NULL)
		return NOFILE;

	SCB* listener_scb = listener_fcb->streamobj;

	if(listener_scb == NULL)
		return NOFILE;

	//check if the socket is a LISTENER 
	if(listener_scb->sock_type != LISTENER)
		return NOFILE;

	//check if the socket is bound to a valid port
	if(listener_scb->port <= 0 || listener_scb->port > MAX_PORT || PORT_MAP[listener_scb->port]==NULL)
		return NOFILE;	

	//sleep the LISTENER until a new request is made
	while(is_rlist_empty(&listener_scb->listener_sock.requestQueue)){
		kernel_wait(&listener_scb->listener_sock.cv_request,SCHED_PIPE);
	}
	//get the request
	rlnode* request = rlist_pop_front(&listener_scb->listener_sock.requestQueue);

	//find the socket that made the request
	SCB* socket1_scb = request->req->scb;
	FCB* socket1_fcb = socket1_scb->fcb;

	//to accept and create the p2p connection: 
	//create a new socket UNBOUND in the same port
	Fid_t socket2_fid = sys_Socket(listener_scb->port);

	//get the fcb from the new socket fid
	FCB* socket2_fcb = get_fcb(socket2_fid);

	if(socket2_fcb == NULL)
		return NOFILE;

	//get the scb of the new socket
	SCB* socket2_scb = socket2_fcb->streamobj;

	if(socket2_scb == NULL)
		return NOFILE;

	//Make both sockets PEERS
	socket1_scb->sock_type = PEER;
	socket2_scb->sock_type = PEER;

	//Now it's time to connect the 2 sockets

	//initialize 2 pipes

	FCB* fcb1[2];
	fcb1[0] = socket1_fcb;
	fcb1[1] = socket2_fcb;

	PIPCB* socket2_pipe = pipe_Init(fcb1);

	FCB* fcb2[2];
	fcb2[0] = socket2_fcb;
	fcb2[1] = socket1_fcb;

	PIPCB* socket1_pipe = pipe_Init(fcb2);

	//Check if Pipes initialized
	if(socket2_pipe == NULL || socket1_pipe == NULL)
		return NOFILE;

	//connect the 2 sockets by connecting the 2 pipes
	socket1_scb->peer_sock.pipe_sender = socket1_pipe;
	socket1_scb->peer_sock.pipe_receiver = socket2_pipe;
    socket2_scb->peer_sock.pipe_sender = socket2_pipe;
	socket2_scb->peer_sock.pipe_receiver = socket1_pipe;

	//each socket has a pointer to show to the other socket connected to
	socket1_scb->peer_sock.socket_pointer = socket2_scb;
	socket2_scb->peer_sock.socket_pointer = socket1_scb;


	//set request_flag = 1 because the connection was successfull
	request->req->request_flag = 1;
	//wake up the request
	kernel_signal(&request->req->cv);

	//return newly created socket fid
	return socket2_fid;
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
		request->scb = scb;
		request->cv  = COND_INIT;
		request->request_flag = 0;
		rlnode_init(&request->req_queue, request);
		//insert the new request in the LISTENER's request queue
		rlist_push_back(&listener_scb->listener_sock.requestQueue, &request->req_queue);
		listener_scb->ref_counter++;

		//wake up the listener to serve the new request
		kernel_signal(&listener_scb->listener_sock.cv_request);  //THIS REQUEST MUST BE SERVED FROM THE LISTENER SOCKETS ACCEPT()
		/*The new request is sleeping until either it is served by the LISTENER or 
		  the timeout has expired. In this case, the connection has failed. 

		  kernel_timedwait returns 1 for success by signal/broadcast or 0 for failure */
		int timed_out = kernel_timedwait(&request->cv, SCHED_USER, timeout);
		//remove the request from the queue because it was served by the LISTENER (either failed or succeeded)

		rlist_remove(&request->req_queue);
		listener_scb->ref_counter--;

		//check if connection has failed due to timeout expiration
		if(timed_out == 0)
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
	Fid_t fid = sock;
	//Only values 0 to MAX_FILEID-1 are legal for file descriptors.
	if(fid < 0 || fid >= MAX_FILEID)
		return -1;

	//Get FCB
	FCB* fcb = get_fcb(fid);
	//Get SCB
	SCB* scb = fcb->streamobj;

	//only PEER sockets can be shutdown
	if(scb->sock_type != PEER)
		return -1;

	switch (how){
		case SHUTDOWN_READ:
			//close the read function of the other PEER socket
			return pipe_reader_close(scb->peer_sock.pipe_receiver);
		case SHUTDOWN_WRITE:
			//close the write function of the other PEER socket
			return pipe_writer_close(scb->peer_sock.pipe_sender);
		case SHUTDOWN_BOTH:
			//close both the read and write function of the other PEER socket
			if(pipe_reader_close(scb->peer_sock.pipe_receiver)==-1||pipe_writer_close(scb->peer_sock.pipe_sender)==-1)
				return -1;
			return 0;
	}
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
			//destroy the peer to peer connection 
			scb->peer_sock.socket_pointer->peer_sock.socket_pointer = NULL;
		}
	}
	else if(scb->sock_type == LISTENER){
		//transform the socket from LISTENER to UNBOUND
		PORT_MAP[scb->port] = NULL;
		//decrease the reference counter of this socket
		scb->ref_counter--;
		//wake up the listener to serve the remaining requests
		kernel_signal(&scb->listener_sock.cv_request);
		//while the queue that holds the requests is not empty
		while(!is_rlist_empty(&scb->listener_sock.requestQueue)){
			//dequeue a request from the head
			rlnode* request = rlist_pop_front(&scb->listener_sock.requestQueue);
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
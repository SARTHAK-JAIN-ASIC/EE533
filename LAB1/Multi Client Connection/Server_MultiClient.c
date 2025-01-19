/* A simple server in the internet domain using TCP
   The port number is passed as an argument */
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <netdb.h>
#include <stdio.h>
#include <sys/types.h> 
#include <sys/socket.h>
#include <netinet/in.h>

void error(const char *msg)
{
    perror(msg);
    exit(1);
}

void dostuff(int multiclient_sockfd){
   char buffer[256] = {0};
   int n;

   n = read(multiclient_sockfd, buffer, 255);
   if(n<0)
	error("ERROR! Could not read. Something is not right(like in your head)");

   buffer[n] = '\0'; //null terminate the buffer since this is C code//
   printf("THE MESSAGE FROM THE CLIENT : %s\n", buffer);

   //write acknowledgement to client for reception//
   n = write(multiclient_sockfd, "I got your message buddy", 25);
   if(n<0)
	error("WOOPS, Failure to write acknowledgement");

   close(multiclient_sockfd);

}

int main(int argc, char *argv[])
{
     int sockfd, newsockfd, portno; //, clilen;
     socklen_t clilen;
     char buffer[256] = {0};
     struct sockaddr_in serv_addr, cli_addr;
     int n;
     pid_t pid;

     if (argc < 2) {
         fprintf(stderr,"ERROR, no port provided\n");
         exit(1);
     }

     sockfd = socket(AF_INET, SOCK_STREAM, 0);     
     if (sockfd < 0) 
        error("ERROR opening socket");
   
     printf("socket created successfully.\n");     

     bzero((char *) &serv_addr, sizeof(serv_addr));
     
     portno = atoi(argv[1]);
     
     serv_addr.sin_family = AF_INET;
     serv_addr.sin_addr.s_addr = INADDR_ANY;
     serv_addr.sin_port = htons(portno);
     
     printf("Attempting to bind...\n");
     fflush(stdout);

     if (bind(sockfd, (struct sockaddr *) &serv_addr,
              sizeof(serv_addr)) < 0){ 
              error("ERROR on binding");
	      exit(1);
     }

     printf("Bind successful, now listening...\n");
     fflush(stdout);
    
     
     listen(sockfd,5);
     printf("Server listening on port %d\n", portno);

     clilen = sizeof(cli_addr); 
    
     printf("Server is waiting for a connection...\n");
     fflush(stdout);
     newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
     
     if (newsockfd < 0){
	  perror("accept() failed"); 
          error("ERROR on accept");
     }
     
     printf("CONNECTION ACCEPTED!\n");
     
     bzero(buffer,256);
     
     n = read(newsockfd,buffer,255);
     
     if (n < 0) error("ERROR reading from socket");
     
     printf("Here is the message: %s\n",buffer);
     
     n = write(newsockfd,"I got your message",18);
     if (n < 0) error("ERROR writing to socket");
    
     while (1) {
        newsockfd = accept(sockfd, (struct sockaddr *)&cli_addr, &clilen);
        if (newsockfd < 0) {
            error("ERROR on accept");
        }

        //Fork() for a new process to handle the client
        pid = fork();
        if (pid < 0) error("ERROR on fork"); //Handling the fork errors

        if (pid == 0) {
            // Child process for handling client connection
            close(sockfd);      // Close the listening socket in other children processes
            dostuff(newsockfd); //Used for communicating with the client
            exit(0);
        } else {
            // Parent process used to continue accepting new connections
            close(newsockfd); // Close the client socket in the parent
        }
    }

     return 0; 
}

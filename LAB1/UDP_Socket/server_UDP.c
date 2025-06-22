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


int main(int argc, char *argv[])
{
     int sockfd, newsockfd, portno; //, clilen;
     socklen_t fromlen, clilen;
     char buffer[256] = {0};
     struct sockaddr_in serv_addr, from_addr;
     //cli_addr;
     int n;

     if (argc < 2) {
         fprintf(stderr,"ERROR, no port provided\n");
         exit(1);
     }

     sockfd = socket(AF_INET, SOCK_DGRAM, 0);     
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
    
     fromlen = sizeof(struct sockaddr_in);

     //listen(sockfd,5);
     //printf("Server listening on port %d\n", portno);
     //clilen = sizeof(cli_addr); 
    
     printf("Server is waiting for a connection...\n");
     fflush(stdout);
     //newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);
     
     if (newsockfd < 0){
	  perror("accept() failed"); 
          error("ERROR on accept");
     }
     
     printf("CONNECTION ACCEPTED!\n");
     
     bzero(buffer,256);

     while(1){
        n = recvfrom(sockfd, buffer, 1024, 0, (struct sockaddr *)&from_addr, &fromlen);
	      if(n<0) error("ERROR IN RECIEVE. CHECK YO CODE DUDE");

        n = sendto(sockfd, "Got your message from hell", 26, 0,(struct sockaddr *) &from_addr, fromlen);
              if(n<0) error("ERROR IN SENDTO. WHAT ARE YA DOIN BUD?");

	printf("Here is the message: %s\n",buffer);
     }
     
     //n = read(newsockfd,buffer,255);
     //if (n < 0) error("ERROR reading from socket");
     //printf("Here is the message: %s\n",buffer);
     //n = write(newsockfd,"I got your message",18);
     //if (n < 0) error("ERROR writing to socket");
    

     return 0; 
}

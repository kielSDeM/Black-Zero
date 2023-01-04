I start to enumerate the machine and run an nmap scan to find open ports on the retro machine.
Since it is a windows machine and most likely blocks pings I use the -Pn(no pings) option.

```
nmap -sV -Pn 10.10.220.226
```

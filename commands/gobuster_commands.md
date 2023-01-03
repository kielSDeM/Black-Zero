```
gobuster dir -u http://driftingblues.box -x php,html,txt --wordlist=/usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -o dir.log
```
```
gobuster vhost  -u driftingblues.box -w /usr/share/wordlists/dirb/common.txt
 ```
 ```
 gobuster dir -u http://10.10.170.82 -x php,txt,tar,zip,old,bak  --wordlist=/usr/share/wordlists/dirb/common.txt
```

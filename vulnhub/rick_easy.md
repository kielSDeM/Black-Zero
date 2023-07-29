We start to enumerate with an Nmap scan.

We find ftp on port 21 which allows anonymous access and we find the first flag ``` FLAG{Whoa this is unexpected}  ```

Aftwards we enumerate port 80 with gobuster and find a cgi-bin directory and a password folder:
```
gobuster dir -u "http://10.0.0.58/" -w /usr/share/wordlists/dirb/common.txt -x php,html,aspx,bak,txt,sh
```
We also enumerate port 9090 and find a flag on the front page ```FLAG {There is no Zeus, in your face!}```

We also find another flag in the passwords folder /password/FLAG.txt. ```FLAG{Yeah d- just don't do it.}```

We have morty's credentials ```morty:winter```



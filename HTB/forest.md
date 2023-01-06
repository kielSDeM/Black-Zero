
Initial scan with nmap came out with several results
Command 
```
nmap -sV -Pn -T4 10.10.10.161 -p-
```

```
ldapsearch -H ldap://10.10.10.161 -x -s base '' "(objectClass=*)" "*" +
```

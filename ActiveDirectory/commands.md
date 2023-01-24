```
ldapsearch -x -h 192.168.162.122 -b "dc=hutch,dc=offsec" > ldap_search.txt
```
```
cat ldap_search.txt | grep -i "samaccountname"
```

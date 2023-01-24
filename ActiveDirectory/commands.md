Use ldap search for user enumeration and store results in a file.
```
ldapsearch -x -h 192.168.162.122 -b "dc=hutch,dc=offsec" > ldap_search.txt
```
clean the file by first getting the usernames only
```
cat ldap_search.txt | grep -i "samaccountname"
```
then copying and pasting them into a file.
```
vi raw_users.txt
```
afterwards we edit and clean the file with this command.
```
cat raw_users.txt | cut -d: -f2 | tr -d " " > users.txt
```

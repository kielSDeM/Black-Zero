We start by looking at the commands that were used on the cmd to try and find the password file that was on the server

search parameters used : ```source="WinEventLog:Microsoft-Windows-Sysmon/Operational"```

Usually hackers lke to use the Temp folder to download there files and I found a bunch of executables that  were
found in the \Temp folder and decided to add the ```\Temp``` parameter to my search:

```
source="WinEventLog:Microsoft-Windows-Sysmon/Operational" \Temp
```
With that we found the answer to question number one

"A Web Browser Password Viewer executed on the infected machine. What is the name of the binary? Enter the full path."

answer: ```C:\Users\FINANC~1\AppData\Local\Temp\11111.exe```

Question #2: What is listed as the company name?

The way we answer this is we add another field to the search called ```Company```. 

answer: ```NirSoft```

Question3:

```
source="WinEventLog:Microsoft-Windows-Sysmon/Operational"C:\\Users\\FINANC~1\\AppData\\Local\\Temp NOT 11111.exe NOT nw12576_540906275 NOT Rkd6YzHKNCjHb NOT build.exe NOT updatewin.exe NOT *.tmp
```

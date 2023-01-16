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

Question3 Another suspicious binary running from the same folder was executed on the workstation. What was the name of the binary? What is listed as its original filename? (format: file.xyz,file.xyz):

We do some digging and decide to go with the command output listed below:
```
source="WinEventLog:Microsoft-Windows-Sysmon/Operational" C:\\Users\\FINANCE01\\AppData\\Local\\Temp\\ NOT 11111.exe NOT nw12576_540906275 NOT Rkd6YzHKNCjHb NOT build.exe   NOT *.tmp NOT Procmon64 NOT splunk DestinationIp="2.56.59.42"
```
We revert back from question 4 and find that the program that is trying to connect to the server is IonicLarger.exe.
To find the original name I decided to take a step back and enter ```IonicLarger.exe``` as the only search parameter 
and added the OriginalFilename field to the the selected fields.

By doing this I was able to find out the original filename which was ```PalitExplorer.exe```

Search Parameters: 
```
source="WinEventLog:Microsoft-Windows-Sysmon/Operational" IonicLarge.exe OriginalFileName="PalitExplorer.exe" 
```
Question 4: The binary from the previous question made two outbound connections to a malicious IP address. What was the IP address? Enter the answer in a defang format.

We did question 4 before we three and used the field ```DestinationIp``` to answer the question.
answer: 2.56.59.42

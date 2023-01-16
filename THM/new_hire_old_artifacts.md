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

We did question 4 before we did question 3 and used the field ```DestinationIp``` to answer the question.
answer: 2.56.59.42

Question 5: The same binary made some change to a registry key. What was the key path?

The way we found this question was we used the search params ```IonicLarge.exe HKLM``` and found the answer in the
first event.

answer: HKLM\SOFTWARE\Policies\Microsoft\Windows Defender

Question 6: Some processes were killed and the associated binaries were deleted. What were the names of the two binaries? (format: file.xyz,file.xyz)

We used the hint from question 6 and used ``` taskkill /im``` as the search parameter and that is how we found the answer.

answer: phcIAmLJMAIMSa9j9MpgJo1m.exe, WvmIOrcfsuILdX6SNwIRmGOJ.exe

Question 7

For question 7 I ran ```powershell``` as the only search parameter and found the answer in the Commandline field at the very bottom.

answer: powershell WMIC /NAMESPACE:\\root\Microsoft\Windows\Defender PATH MSFT_MpPreference call Add ThreatIDDefaultAction_Ids=2147735503 ThreatIDDefaultAction_Actions=6 Force=True

Question 8: Based on the previous answer, what were the four IDs set by the attacker? Enter the answer in order of execution. (format: 1st,2nd,3rd,4th)

From the same search as question 7 we once again went to the commandline field and found the answers there.

answer: 2147735503, 2147737007, 2147737010, 2147737394 

Question 9: Another malicious binary was executed on the infected workstation from another AppData location. What was the full path to the binary?
For this one we just used ```AppData``` as the search parameter and found it as one of the first results.

answer: C:\Users\Finance01\AppData\Roaming\EasyCalc\EasyCalc.exe

Question 10: What were the DLLs that were loaded from the binary from the previous question? Enter the answers in alphabetical order. (format: file1.dll,file2.dll,file3.dll)

For this we use ```EasyCalc``` as the search parameter and then use the ```OriginalFileName``` field to answer the question.

answer: ffmpeg.dll, nw.dll,  nw_elf.dll

Congratulations for Completing this room!!! The last answer is autocompleted for you and I hope that you enjoyed my walkthrough!





First we searched the logs for suspicious activities,
 ```
 source="wineventlog:microsoft-windows-sysmon/operational"
 ```
We used cyberchef to decrypt the base64 code and to defang the url that was found.
We added Binary to the filter and found the executable that was used to access the machine.
We continued to search to see how the binary was running with elevated privileges and found 
out that it was C:\Windows\system32\schtasks.exe that was being used.
We found a remote server that the attacker was connecting to and began to look for suspicious files that
could be dangerous to the system. We found the ransomware note in
C:\Users\keegan\Downloads\vasg6b0wmw029hd\BlackSun_README.txt and an image C:\Users\Public\Pictures\blacksun.jpg.

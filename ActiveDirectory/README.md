# Active Directory Administrator Accounts

BUILTIN\Administrator	Local admin access on a domain controller
Domain Admins	Administrative access to all resources in the domain
Enterprise Admins	Available only in the forest root
Schema Admins	Capable of modifying domain/forest; useful for red teamers
Server Operators	Can manage domain servers
Account Operators	Can manage users that are not in privileged groups

# Domain and User Enumeration

List accounts wiht administrative access to the current machine
```
net localgroup administrators
```
List accounts and groups with administrativer access to the domain controller
```
net localgroup administrators /domain
```
Display hosts currently visible on the network
```
net view /domain
```
Display all users in the current domain
```
net user /domain
```
Display user information for domain user account (status, policy, groups, etc.)
```
net user <USERNAME> /domain
```
Display domain account policies
```
net accounts /domain
```
Display domain groups
```
net group /domain
```
Display users in a domain group
```
net group "<GROUPNAME>" /domain
```
Display domain controllers in the current domain
```
net group "Domain Controllers" /domain
```
Display all computer hostnames for current domain
```
net grtoup "Domain Computers" /domain
```
Unlock domain user account
```
net user <USERNAME> /ACTIVE:YES /domain
```
Change domain user password
```
net user <USERNAME> "<PASSWORD>" /domain
```

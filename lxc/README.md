```
git clone https://github.com/saghul/lxd-alpine-builder.git
cd lxd-alpine-builder
sudo bash build-alpine
```
```python -m http.server --bind=0.0.0.0```
```wget  http://0.0.0.0/{alpine-image}```

```lxd init```

```
lxc image import ./apline-v3.10-x86_64-20191008_1227.tar.gz --alias myimage
lxc init myimage ignite -c security.privileged=true
lxc config device add ignite mydevice disk source=/ path=/mnt/root recursive=true
lxc start ignite
lxc exec ignite /bin/sh
```

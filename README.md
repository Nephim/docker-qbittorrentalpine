# Lightweight qBittorrent docker container
This image is built from alpine linux running [qBittorrent-nox-static](https://github.com/userdocs/qbittorrent-nox-static)

## Password
On first boot the automatically generated password is printed into the container console. If you started the container detached use `docker logs` to get the password.

```sh
docker ps
```

```
CONTAINER ID   IMAGE                       ...   NAMES
f2103cdc3991   nephim/qbittorrentalpine    ...   qbitalpine
```


```sh
docker logs f2103cdc3991
# or if you have given the container a name
docker logs qbitalpine
```

```
******** Information ********
To control qBittorrent, access the WebUI at: http://localhost:8080
The WebUI administrator username is: admin
The WebUI administrator password was not set. A temporary password is provided for this session: PdXdEZK8n
You should set your own password in program preferences.
```

The password can then be changed through the WebUI and will be saved in the config files.

### Forgot the password?
1. Stop the container

2. Open the following file from the config folder you have hopefully bind mounted with the docker container.
```
config/qBittorrent/qBittorrent.conf
``` 

3. The password can be reset by deleting these lines

```conf
[Locking]
password=<encrypted_password>         # this only appear on qBittorrent version < 4.2.0
password_PBKDF2=<encrypted_password>  # this only appear on qBittorrent version ≥ 4.2.0
locked=true
```

4. Start the container again
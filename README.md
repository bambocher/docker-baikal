## Alpine Baikal Docker Container

### Run:

Run Baikal container:

```shell
docker run \
    --publish 80:80 \
    --name baikal \
    --restart always \
    --detach \
    bambucha/baikal
```

Setup Baikal using [installer](http://localhost/install.php).

### Data container

Create data container:

```shell
docker run --volumes-from baikal --name baikal-data busybox
```

Now you can safely delete baikal container:

```shell
docker stop baikal && docker rm baikal
```

To restore baikal, create new baikal container and attach baikal-data volume to it:

```shell
docker run \
    --publish 80:80 \
    --volumes-from baikal-data \
    --name baikal \
    --restart always \
    --detach \
    bambucha/baikal
```

### Backup

Create baikal-backup.tar.gz archive in current directory using temporaty container:

```shell
docker run \
    --rm \
    --volumes-from baikal-data \
    --volume $(pwd):/backups \
    alpine:3.2 \
    tar zcvf /backups/baikal-backup.tar.gz /baikal
```

### Restore

Run DokuWiki container:

```shell
docker run \
    --publish 80:80 \
    --name baikal \
    --restart always \
    --detach \
    bambucha/baikal
```

Create data container:

```shell
docker run --volumes-from baikal --name baikal-data busybox
```

Stop baikal:

```shell
docker stop baikal
```

Restore from backup using temporary container:

```shell
docker run \
    --rm \
    --volumes-from baikal \
    -w / \
    -v $(pwd):/backup \
    alpine:3.2 \
    tar xzvf /backup/baikal-backup.tar.gz
```

Start baikal:

```shell
docker start baikal
```

### Build:

```shell
git clone https://github.com/bambocher/docker-baikal
cd docker-baikal
docker build --tag bambucha/baikal .
```

### License

[The MIT License (MIT)](LICENSE)

## Alpine Baikal Docker Container

[![GitHub Tag](https://img.shields.io/github/tag/bambocher/docker-baikal.svg)](https://registry.hub.docker.com/u/bambucha/baikal/)
[![Docker Stars](https://img.shields.io/docker/stars/bambucha/baikal.svg)](https://registry.hub.docker.com/u/bambucha/baikal/)
[![Docker Pulls](https://img.shields.io/docker/pulls/bambucha/baikal.svg)](https://registry.hub.docker.com/u/bambucha/baikal/)
[![Docker Automated Build](https://img.shields.io/badge/automated-build-green.svg)](https://registry.hub.docker.com/u/bambucha/baikal/)
[![Docker License](https://img.shields.io/badge/license-MIT-green.svg)](https://registry.hub.docker.com/u/bambucha/baikal/)

### Usage:

```shell
docker run \
    --publish 80:80 \
    --volume `pwd`/config:/baikal/Specific
    --name baikal \
    --restart always \
    --detach \
    bambucha/baikal
```

Setup Baikal using [admin](http://localhost/admin).

### License

[The MIT License](LICENSE)

# HDLGManClient in Docker

[![Docker](https://github.com/ticky/docker-hdlgmanclient/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/ticky/docker-hdlgmanclient/actions/workflows/docker-publish.yml)

## Running

```shell
docker run -it --rm \
           --platform linux/i386 \
           --publish="5901:5900/tcp" \
           --volume /volume1:/data:ro \
           ticky/hdlgmanclient
```

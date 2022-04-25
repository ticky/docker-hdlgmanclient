# HDLGManClient in Docker

## Running

```shell
docker run -it --rm \
           --platform linux/i386 \
           --publish="5901:5900/tcp" \
           --volume /volume1:/data:ro \
           ticky/hdlgmanclient
```

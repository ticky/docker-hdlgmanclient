# HDLGManClient in Docker

[![Docker](https://github.com/ticky/docker-hdlgmanclient/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/ticky/docker-hdlgmanclient/actions/workflows/docker-publish.yml)

The [HDLGameInstaller](https://sites.google.com/view/ysai187/home/projects/hdlgameinstaller) client in a virtual desktop in Docker. Ideal for running on a NAS, for example

## Running

```shell
docker run -it --rm \
           --platform linux/i386 \
           --publish="5901:5900/tcp" \
           --publish="45062:45062/tcp" \
           --volume /volume1:/data:ro \
           ghcr.io/ticky/docker-hdlgmanclient:main
```

## Usage

Use Screen Sharing on Mac, or another VNC client to connect to port 5901 in the above example. Mount a folder with data in it to `/data` (`/volume1` in the above example).

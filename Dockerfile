FROM i386/alpine:3.15

RUN apk add \
      --no-cache \
      xvfb \
      x11vnc \
      xdpyinfo \
      wine \
      p7zip

WORKDIR /tmp

ADD https://archive.org/download/181208-hdlgman-client/%5B181208%5DHDLGameInstaller-0821-bin.zip /tmp/HDLGameInstaller.zip

RUN 7z x HDLGameInstaller.zip && \
    mkdir /app && \
    mv \[*\]HDLGameInstaller*/PC/* /app && \
    rm -rf /tmp/* && \
    winepath C:\\ && \
    ln -s /data /root/.wine/dosdevices/d:

ENV DISPLAY=":0"
ENV DESKTOP_SIZE="800x600"
ENV X_SCREEN_DIMENSIONS="${DESKTOP_SIZE}x24+32"
ENV VNC_PASSWORD="HDLGManClient"

WORKDIR /app
EXPOSE 5900/tcp
EXPOSE 45062/tcp
VOLUME /data

ADD docker-entrypoint.sh /bin

CMD ["docker-entrypoint.sh"]

FROM i386/alpine:3.15

RUN apk add \
      --no-cache \
      xvfb \
      x11vnc \
      xdpyinfo \
      wine \
      p7zip

WORKDIR /tmp

ADD https://download2391.mediafire.com/x3g5bm02c4kg/sglo6cn71gfoht1/%5B181208%5DHDLGameInstaller-0821-bin.7z /tmp/HDLGameInstaller.7z

RUN 7zr x HDLGameInstaller.7z && \
	mkdir /app && \
	mv PC/* /app && \
	rm -rf /tmp/* && \
	winepath C:\\ && \
	ln -s /data /root/.wine/dosdevices/d:

ENV DISPLAY=":0"
ENV DESKTOP_SIZE="800x600"
ENV X_SCREEN_DIMENSIONS="${DESKTOP_SIZE}x24+32"
ENV VNC_PASSWORD="HDLGManClient"

WORKDIR /app
EXPOSE 5900/tcp
VOLUME /data

ADD docker-entrypoint.sh /bin

CMD ["docker-entrypoint.sh"]

FROM ubuntu:20.04
ADD https://api.gogen.io/linux/gogen /usr/bin/gogen
RUN chmod 755 /usr/bin/gogen
RUN sh -c 'echo dash dash/sh boolean false | debconf-set-selections' && \
    sh -c 'DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash' && \
    apt-get update && \
    apt-get install -y vim curl ca-certificates jq netcat && \
    rm -rf /var/lib/apt/lists/*
## Add the wait script to the image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod +x /wait
ADD entrypoint.sh /sbin/entrypoint.sh
WORKDIR /gogen
CMD ["/bin/bash"]

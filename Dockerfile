FROM debian:latest
LABEL maintainer="rcyphers"
LABEL description="This example Dockerfile installs Suricata4.0.1"

ENV VER=4.0.1
WORKDIR /opt
ADD http://www.openinfosecfoundation.org/download/suricata-$VER.tar.gz /tmp

ENV DEBIAN_FRONTEND noninteractive
RUN tar -zxf /tmp/suricata-$VER.tar.gz \
    && rm -f /tmp/suricata-$VER.tar.gz \
    && cd /opt/suricata-$VER \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get install -y wget libpcre3 libpcre3-dbg libpcre3-dev \
build-essential autoconf automake libtool libpcap-dev libnet1-dev \
libyaml-0-2 libyaml-dev zlib1g zlib1g-dev libcap-ng-dev libcap-ng0 \
make libmagic-dev libjansson-dev libjansson4 pkg-config \
     && ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
     && make \
     && make install-full \
     && ldconfig

VOLUME /var/log/suricata

ADD files/start.sh /start.sh
RUN chmod u+x /start.sh
ENTRYPOINT ["/start.sh"]

FROM ubuntu:bionic

# Add powerdns repository
ADD powerdns.pref /etc/apt/preferences.d/powerdns
ADD https://repo.powerdns.com/FD380FBB-pub.asc /etc/apt/trusted.gpg.d/powerdns.asc
RUN echo 'deb [arch=amd64] http://repo.powerdns.com/ubuntu bionic-rec-43 main' >> /etc/apt/sources.list \
  && chmod 0644 /etc/apt/trusted.gpg.d/powerdns.asc

# install pdns-recursor
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y pdns-recursor=4.3.0-1pdns.bionic lua-rex-pcre \
  && mkdir -p /var/run/pdns-recursor \
  && rm -rf /var/lib/apt/lists/*
ADD recursor.conf /etc/powerdns/recursor.conf

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/pdns_recursor", "--setuid=pdns", "--setgid=pdns", "--daemon=no", "--local-address=0.0.0.0", "--local-port=53"]

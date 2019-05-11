FROM alpine:edge

RUN apk add --no-cache pdns-recursor=4.1.12-r2

COPY recursor.conf /etc/pdns/recursor.conf

EXPOSE 53/tcp
EXPOSE 53/udp

CMD "/usr/sbin/pdns_recursor"

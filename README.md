# Docker PowerDNS Recursor

The PowerDNS Recursor is a high-performance DNS recursor with built-in scripting capabilities.   
It is known to power the resolving needs of over 150 million internet connections.

## Installation

Builds of the image are available on [Dockerhub](https://hub.docker.com/r/tmuncks/pdns-recursor).

```
docker pull tmuncks/pdns-recursor:latest
```

Alternatively you can build the image locally.

```
docker build -t pdns-recursor . 
```

## Quick Start

You can run pdns-recursor

```
docker run -d --rm -p 53:53/udp -p 53:53/tcp --name pdns-recursor tmuncks/pdns-recursor
```

### Configuration

Docker image comes with a
[recursor.conf](https://github.com/tmuncks/docker-pdns-recursor/blob/master/recursor.conf).

You can mount your conf inside the container:

```
docker run -d --rm -p 53:53/udp -p 53:53/tcp -v /etc/powerdns/recursor.conf:/etc/powerdns/recursor.conf \
  --name pdns-recursor pdns-recursor
```

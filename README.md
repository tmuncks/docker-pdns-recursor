# PowerDNS Recursor

The PowerDNS Recursor is a high-performance DNS recursor with built-in scripting capabilities. A [full description](https://www.powerdns.com/recursor.html) can be found on the [project website](https://www.powerdns.com/).

## The Image

<https://hub.docker.com/r/tmuncks/pdns-recursor/>

Docker image with PowerDNS Recursor.

```text
(name=value)

PDNS_allow_from=0.0.0.0/0
PDNS_dnssec=validate
```

The PowerDNS recursor is configurable via env vars. Every variable starting with `PDNS_` will be inserted into the default `/etc/powerdns/recursor.conf` config file in the following way:

* Prefix `PDNS_` will be stripped
* Every `_` will be replaced with `-`

Example from above config; `PDNS_allow_from=0.0.0.0/0` will become `allow-from=0.0.0.0/0` in `/etc/powerdns/recursor.conf` file. This way, you can configure PowerDNS recursor any way you need, within a `docker run` command.

You can find [here](https://doc.powerdns.com/recursor/settings.html) all available settings.

## Examples

Recurser accepting queries from everywhere:

```bash
docker run -d -p 53:53 -p 53:53/udp --name pdns-recursor \
  --hostname ns1.example.com \
  -e PDNS_allow_from=0.0.0.0/0 \
  -e PDNS_dnssec=validate \
  tmuncks/pdns-recursor
```

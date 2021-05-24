#!/bin/bash

set -euo pipefail

# Create config file based on PDNS_ environment variables
while read -r setting; do
    param="${setting/PDNS_/}"
    echo "${param//_/-}=${!setting}"
done < <(compgen -v "PDNS_") > /etc/powerdns/recursor.conf

exec "$@"

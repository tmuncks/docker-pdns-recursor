#!/bin/bash

set -euo pipefail

# Setup recommended defaults
PDNS_lua_config_file=${PDNS_lua_config_file:="/etc/powerdns/recursor.lua"}

# Create config file based on PDNS_ environment variable
# - Skip if the file has been mounted from the outside
if ! mountpoint -q "/etc/powerdns/recursor.conf"; then
    while read -r setting; do
        param="${setting/PDNS_/}"
        echo "${param//_/-}=${!setting}"
    done < <(compgen -v "PDNS_") > /etc/powerdns/recursor.conf
fi

exec "$@"

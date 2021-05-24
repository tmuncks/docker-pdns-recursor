#!/bin/bash

set -euo pipefail

# Setup recommended defaults
PDNS_local_address=${PDNS_local_address:="0.0.0.0"}
PDNS_local_port=${PDNS_local_port:="53"}
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

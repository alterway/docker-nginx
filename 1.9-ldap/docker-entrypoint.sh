#!/bin/bash
set -e

#
# set localtime
ln -sf /usr/share/zoneinfo/${LOCALTIME:-Europe/Paris} /etc/localtime

#
# functions



#
# Run

if [[ ! -z "$1" ]]; then
    exec "${*}"
else
    exec nginx -g 'daemon off;'
fi

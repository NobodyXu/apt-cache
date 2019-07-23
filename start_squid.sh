#!/usr/bin/env bash

source /usr/share/squid-deb-proxy/init-common.sh

pre_start
post_start

avahi-daemon -D
$SQUID -YC -u 0 -N -f /etc/squid-deb-proxy/squid-deb-proxy.conf

post_stop

exec avahi-daemon -k

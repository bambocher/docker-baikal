#!/usr/bin/env ash
mkdir -p /baikal/Specific/db/ \
    && chown -R lighttpd. /baikal \
    && lighttpd -D -f /etc/lighttpd/lighttpd.conf


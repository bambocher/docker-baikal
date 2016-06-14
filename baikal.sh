#!/usr/bin/env ash
chown -R lighttpd. /baikal \
    && lighttpd -D -f /etc/lighttpd/lighttpd.conf


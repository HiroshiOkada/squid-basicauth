#!/bin/sh

if [ $# -eq 0 ]; then
    if [ -z "${PW}" -o -z "${NAME}" ]; then
        echo "set PW and NAME"
        exit 1
    fi
    printf "%s\n%s\n" "${PW}" "${PW}" | /usr/sbin/mini_htpasswd -c /etc/squid/htpasswd "${NAME}"

    /usr/sbin/squid -f /etc/squid/squid.conf
    exec nc -u -l -p 3129
else
    exec "$@"
fi 


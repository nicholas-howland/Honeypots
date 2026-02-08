#!/bin/bash
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 1:65535 -j REDIRECT --to-ports 8000
# /dev/random may also be able to be used here, but we know that the following will work
gcc flood-terminal.c -o flood-terminal
nc -tlv -n -e ./flood-terminal -p 8000

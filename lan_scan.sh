#!/bin/sh
arp -a | sort -k2,2 | awk '{print $2, $1 }'
sleep 1
echo -e
echo -n "Number of hosts: "
arp -a | sort -k2,2 | awk '{print $2, $1 }' | wc -l
echo -e
sleep 1

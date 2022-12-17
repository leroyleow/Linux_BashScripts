#!/bin/bash
#
# Ping Sweep
# Reference -> ping -c 1 192.168.0.1 | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"
# Author: leroy Leow

read -p "Please Key in subnet : " SUBNET
for ip in {1..254}; do
    ping -c 1 $SUBNET.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & # & -> create multiple threads
done
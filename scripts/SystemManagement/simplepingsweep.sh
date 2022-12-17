#!/bin/bash
#
# Simple Ping Sweep
# Author: leroy Leow

read -p "Please enter the subnet:" SUBNET_STR

for IP in {1..254}; do
    ping -c 1 ${SUBNET_STR}.${IP}   # ping each address once 
done


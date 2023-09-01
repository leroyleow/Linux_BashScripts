#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script email /tmp/filtered-message to IT
# Usage: logtailemail

IT="alck01@turfclub.com.sg"

if [ -s /tmp/filtered-message ]
then
    cat /tmp/filtered-message | sort | unique | mail -s "syslog message" $IT
    rm /tmp/filtered-messages
fi
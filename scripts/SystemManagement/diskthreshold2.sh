#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will check disk space
# Usage: diskthreshold

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5,$1}' | while read output
do
    usep=$(echo $output | awk '{print $1}' | cut -d'%' -f1 ) #$1 = $5 above
    partition=$(echo $output | awk '{print $2 }' ) #$2 = $1 above

    if [$usep -ge 90 ]
    then
        echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)"
    fi
done
#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will check disk space
# Usage: diskthreshold

# egrep is filter out
# tail -n+2 filter out top line
# awk get 5th col
# trim %
# assign to variable a
a=`df -h | egrep -v "tmpfs|devtmpfs" | tail -n+2 | awk '{print $5}' | cut -d'%' -f1`

for i in $a
do
    if [ $i -ge 50 ]
    then
        echo Check disk space $i `df -h | grep $i`
    fi
done
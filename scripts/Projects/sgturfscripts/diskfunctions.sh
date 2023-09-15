#!/bin/bash

fndiskabovethreshold {
THRESHOLD=$1
a=`df -h | egrep -v "tmpfs|devtmpfs" | tail -n 2 | awk '{print $5}' | cut -d '%' -f1`

for i in $a
do
	if [ $i -ge $THRESHOLD ]
	then
		echo Check disk space $i `df -h | grep $i`
	fi
done
}

#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will ping multiple remote host
# Usage: healthprob <remote host list>

echo "This script will ping multiple remote hosts define in a remote host list"

if [ "$#" -ne 1 ] 
then 
 echo "Usage healthprob <remote host list>"; exit 1;
fi

while read REMOTESERVER
do
    ping -c1 $REMOTESERVER &> /dev/null # any errors goes to null
    if [ $? -eq 0 ]
    then
        echo "$REMOTESERVER OK"
    else
        echo "$REMOTESERVER NOT OK"
    fi
done < $1
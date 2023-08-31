#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will check all the directories in /home and check are they valid directory againt /etc/passwd
# Usage: pull_log <error/warn/fail> <logfilefullpath>

cd /home
for DIR in * 
do
    CHK=$(grep -c "/home/$DIR" /etc/passwd)
    if [ $CHK -ge 1 ]
    then 
        echo "$DIR is assigned to a user"
    else
        echo "$DIR is NOT assigned to a user"
    fi
done
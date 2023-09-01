#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will trace /var/log/message file
# Usage: logtail

# last message -f => [live] n0 => look for latest message
tail -fn0 /var/log/messages | while read line
do
    echo $line | egrep -i "refused|invalid|error|fail|lost|shut|down|offline"
    if [ $? = 0 ]
    then
        echo $line >> /tmp/filtered-messages
    fi
done
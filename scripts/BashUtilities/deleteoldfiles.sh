#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will delete old files, more than 90 days. 
# Usage: deleteoldfiles <options:l/d> <folderpaths>

echo "This script will delete old files, more than 90 days."
echo "USAGE: deleteoldfiles <-l/d> <folderpath1>....<folderpathN>"

OPTION=$1

for FOLDER in ${@:2}
do
    if [ $OPTION -eq "-l" ]
    then
        echo "---------${FOLDER}-----------"
        find $FOLDER -mtime +90 -exec ls l {} \;
    elif [ $OPTOIN -eq "-d" ]
    then
        echo "--------Delete-------------"
        find $FOLDER -mtime +90 -exec rm {} \;
    else
        echo "USAGE: deleteoldfiles <-l/d> <folderpath1>....<folderpathN>"
        exit 1;
    fi
done
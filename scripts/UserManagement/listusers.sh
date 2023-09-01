#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will check all user logged in by date
# Usage: listusers [date]

if [ $# -ne 1 ] 
then 
    echo "Please enter day (e.g. Mon)"
    read d
    echo
    echo "Please enter month (e.g Aug)"
    read m
    echo
    echo "Please enter date (e.g 28)"
    read da
    echo

    last | grep "$d $m $da" | awk '[print $1]'
else 
    TODAY=`date | awk '[print $1 $2 $3]'`
    last | grep "$today" | awk '[print $1]'
fi

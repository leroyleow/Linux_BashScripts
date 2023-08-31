#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will pull Error/Warning message from input log file 
# Usage: pull_log <error/warn/fail> <logfilefullpath>

echo "This script will pull only error messages from the log file"

if [ "$#" -ne 2 ] 
then 
 echo "Usage pull_error <error/warn> <logfile full path>"; exit 1;
fi

grep -i $1 $2



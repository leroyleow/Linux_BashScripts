#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will create user account
# Usage: disableuser-for

a=`lastlog -b 90 | tail n+2 | awk '{print $1}'`

for i in $account
do
    usermod -L $i
done
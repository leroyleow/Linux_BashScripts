#!/bin/bash

# Script generate a random password 
#
# Author: Leroy Leow
# dependencies : openssl

echo "========Password Generator==========="
read -p "Enter a the password length: " PASSWDLEN
echo "====================================="

# generate 5 password
for index in {1..5};
do
    # using openssl to generate a random base64 number, taking all the 48 numbers , then password base on length
    openssl rand -base64 48 | cut -c 1-${PASSWDLEN}
done


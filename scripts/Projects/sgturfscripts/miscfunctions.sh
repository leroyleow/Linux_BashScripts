#!/bin/bash

function fngeneratepassword5 {
echo "===========Password Generator==========="
echo "Enter the password length: " 
read PASSWDLEN
echo "=======================================" 

# generate 5 password
for index in {1..5};
do
    # using openssl to generate a random base64 number, taking all the 48 numbers , then password base on length
    echo -e $CGNS`openssl rand -base64 48 | cut -c 1-${PASSWDLEN}`$CE
    
done
}

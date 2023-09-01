#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will create user account
# Usage: createuser

echo "Please provide a username"
read u
echo

grep -q $u /etc/passwd
    if [ $? -eq 0 ]
    then
        echo ERROR -- User $u already exist
        echo Please choose another username
        echo
        exit 0
    fi

echo "Please provide user description"
read d
echo 

echo "Do you wwant to specify user ID [y/n]?"
read ynu
echo

    if [ $ynu == y ]
    then
        echo  "Please enter UID?"
        read uid

        grep $uid /etc/passwd
            if [ $? -eq 0 ]
            then
                echo ERROR -- UserId $uid already exist
                echo
                exit 0
            else
                useradd $u  -c "$d" -u $uid
                echo
                echo $u account has been created
            fi
    elif [ $ynu == n ]
    then   
        echo No worries we will assign a UID
        useradd $u -c "$d"
        echo $u account has been created
    else
        echo Invalid chocie
        exit 1
    fi

#!/bin/bash

function fncreateuser {
echo "Please provide a username" 
read u
echo
grep -q $u /etc/passwd
if [ $? = 0 ]
then
	echo -e "ERROR -- Username $u already exists"
	echo -e "Please choose another username"
	exit 1
fi
echo -e "Please provide user description"
read d
echo

echo "Do you want to specify user ID (Y/N)?"
read ynu
echo

if [[ "${ynu,,}" = "y" ]]
then
	echo "Please enter UID?"
	read uid

	grep $uid /etc/passwd
	if [ $? = 0 ]
	then
		echo -e "ERROR -- Userid $uid already exists"
		echo 
		exit 1i
	else
		useradd $u -c "$d" -u $uid
		echo
		echo -e "$u account has been created"
	fi
elif [[ "${ynu,,}" = "n" ]] 
then
	echo No Worries we will auto assign a UID
	useradd $u -c "$d"
	echo $u account has been created
else
	echo Invalid choice. Exiting.
	exit 1
fi
}

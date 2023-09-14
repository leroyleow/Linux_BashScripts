#!/bin/bash

function fncreateuser {
echo "Please provide a username" 
read u
echo
grep -q $u /etc/passwd
if [ $? = 0 ]
then
	echo -e "ERROR -- Username $u already exists"
	return 1
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
		return 1
	else
		useradd $u -c "$d" -u $uid
		echo
		echo -e "$u account has been created. Please run passwd cmd to set passwd"
		return 0
	fi
elif [[ "${ynu,,}" = "n" ]] 
then
	echo No Worries we will auto assign a UID
	useradd $u -c "$d"
	echo $u account has been created. Please run passwd cmd to set passwd
	return 0
else
	echo Invalid choice. Exiting.
	return 1
fi
}
function fndisableuser {
echo "Please enter username to disable"
read u
grep -q $u /etc/passwd
if [[ $? = 0 ]]
then
	echo "Username found. Proceed to disable ? (Y/N)"
	read ynu
	if [[ "${ynu,,}" = "y" ]]
	then
		usermod -L $u
		if [[ $? = 0 ]]
		then	
			echo "$u is disabled"
			return 0
		else
			echo -e "ERROR. Exiting"
			return 1
		fi
	fi
else
	echo -e "ERROR. Username not found"
	return 1
fi
}
function fndisbleusermore90 {
lastlog -n 90 | tail -n+2 | awk '{print $1}' | xargs -I{} usermod -L {}
}

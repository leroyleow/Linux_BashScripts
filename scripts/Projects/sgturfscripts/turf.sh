#!/bin/bash

# set -x # turn off debug
VERSION=1.0.0
AUTHOR="Leroy Leow"
LATESTCHANGELOGLINES=26
TERMINALTITLE="MAIN"
############DEFAULTS################
TURFPATH="$HOME/turf"
export TURFPATH

LOGPATH="$HOME/turf/logs"

#yellow
    CYS="\e[1;33m"
#blue start 
	CBS="\e[0;34m"
#color end
	CCE="\e[0m"
#red start
	CRS="\e[1;31m"
#black start
	CBLS="\e[0;30m"
#dark gray start
	CDGYS="\e[1;30m"
#light blue start
	CLBS="\e[1;34m"
#green start
	CGNS="\e[0;32m"
#light green start
	CLGNS="\e[1;32m"
#cyan start
	CCYS="\e[0;36m"
#light cyan start
	CLCYS="\e[1;36m"
#light red start
	CDRS="\e[0;31m"
#purple start
	CPS="\e[0;35m"
#light purple start
	CLPS="\e[1;35m"
#brown start
	CBRS="\e[0;33m"
#light gray start
	CLGYS="\e[0;37m"
#white start
	CWHS="\e[1;37m"
# setting custom color for logo
    if [[ -f "$LPATH"/settings/logocolor.txt ]]
    then
        read COL < grep LOGOCOLOR "$LPATH"/settings/logocolor.txt
    else
        COL="$CBS"
    fi
############Tools###################
###function:menu
MAINMENU=(1:usermenu:User_Menu:
	2:logmenu:Log_Menu)

USERMENU=(1:createuser:Create_User
	2:disableusers:Disable_User
	3:listusers:List_Users)

LOGMENU=(1:listxdaysapachelogs:List_X_Days_Apache_Logs
	2:listxdayslumenlogs:List_X_Days_Lumen_Logs
	3:listxdayslogs:List_X_Days_Logs_In_Directories)

#setting frequent stings
	YNYES="("$CYS"y"$CE"/"$CYS"n"$CE")("$CYS"Enter"$CE"=yes)"
	YNNO="("$YS"y"$CE"/"$YS"n"$CE")("$YS"Enter"$CE"=no)"
	YNONLY="("$YS"y"$CE"/"$YS"n"$CE")"
	PAKT="Press "$YS"any key$CE to"
	PAKTC="Press "$YS"any key$CE to continue..."
	PAKTGB="Press "$YS"any key$CE to go back..."
	TNI=""$RS"Tool is not installed. To install it type '"$CE""$YS"install"$CE""$RS"'."$CE""
	#code to read from keyboard without return
	READAK="read -n 1"

############FUNCTIONS###############
function createuser {
	echo "Please provide a username"
	red u
	echo
	grep -q $u /etc/passwd	#check if user exist
	if [ $? -eq 0 ]
		echo -e $CRS"Error -- User $u already exist"$CE
		echo -e $CWHS"Please chooese another username"$CE
		echo
		return 1
	fi
	echo -e $CHWS"Please provide user description"$CE
	read d
	echo

	echo $YNNO"Do you want to specify user ID?"
	read ynu
	echo

	if [[ $ynu = "y" ]]
	then
		echo "Please enter UID?"
		read uid

		grep $uid /etc/passwd
		if [[ $? -eq 0 ]]
		then
			echo -e $CRS"ERROR -- UserId $uid already exist"
			echo
			return 1
		else
			useradd $u -c "$d" -u $uid
			echo
			echo -e $CGNS" $u account has been created"$CE
		fi
	elif [[ $ynu = "n" ]]
	then
		echo No worries we will auto assign a UID
		useradd $u -e "$d"
		echo $u account has been created 
	else
		echo Invalid choice
		return 1
	fi
}
function fn_latest_changelog {
	echo -e $CWHS"Latest CHANGELOG ["$VERSION"]"$CE
	echo -e " What is included in this update: "
	cat "$LPATH"/Changelog | head -n $LATESTCHANGELOGLINES 
	echo -e "$PAKTC"
	$READAK
}
function dash_calc
{
	
	size=${#TERMINALTITLE}
	calc=$(( 65-size ))
	calc=$(( calc/2 ))
	numcalc=1
	DASHESN="-"
	while [ $numcalc != $calc ]
	do
		DASHESN=""$DASHESN"-"
		numcalc=$(( numcalc+1 ))
	done
	echo -e "$DASHESN"$RS"$TERMINALTITLE"$CE"$DASHESN"
}
function fn_banner {
echo -e ""
echo -e "$COL    ██████╗  █████╗  ██████╗███████╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██╗$CE $CWHS v$VERSION"     
echo -e "$COL    ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║$CE"     
echo -e "$COL    ██████╔╝███████║██║     █████╗  ██████╔╝██║   ██║██████╔╝   ██║   ███████║██║$CE"     
echo -e "$COL    ██╔══██╗██╔══██║██║     ██╔══╝  ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║$CE"     
echo -e "$COL    ██║  ██║██║  ██║╚██████╗███████╗██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║███████╗$CE"
echo -e "$COL    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝$CE"
echo -e "$CWHS The $CE"                                                                                  
echo -e "$COL    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗$CE"                                      
echo -e "$COL    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝$CE"                                      
echo -e "$COL    ███████╗██║     ██████╔╝██║██████╔╝   ██║   $CE    by $CWHS $AUTHOR $CE"                                      
echo -e "$COL    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   $CE"                                      
echo -e "$COL    ███████║╚██████╗██║  ██║██║██║        ██║   $CE"                                      
echo -e "$COL    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   $CE"                                      
echo -e "$CLCYS====================================================================================$CE"
}
function main_menu {
	TERMINALTITLE="Main"
	dash_calc
	for M in ${MAINMENU[@]}
	do
		A=(${M//:/ })
		echo -e $CYS${A[0]}$CE")"$CWHS${A[2]//_/ }$CE
	done  |xargs -L3 |column -t

	echo -e $CYS"0)"$CE$CWHS"Exit"$CE
}
function main_options {
	CHOICE=$1

	while 0
	do
		if [[ $CHOICE = "1" ]]
		do

		done
		elif [[ $CHOICE = "2" ]]
		do


		done
		elif [[ $CHOICE = "0" ]]
		do
			echo -e $CLGYS"Exiting now"$CE
			exit 0
		done

	done
}
#------------------- Main Code --------------------------
fn_banner
main_options

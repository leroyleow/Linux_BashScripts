#!/bin/bash


# https://github.com/mitchellkrogza/linux-server-administration-scripts/blob/master/ftpbackup.sh
# https://github.com/hwixley/WIX-CLI
# https://github.com/bobbyiliev/introduction-to-bash-scripting/blob/main/ebook/en/content/019-working-with-cloudflare-api-with-bash.md
# https://github.com/miguelgfierro/scripts

# set -x # turn off debug
VERSION=1.0.0
AUTHOR="Leroy Leow"
LATESTCHANGELOGLINES=26
TERMINALTITLE="MAIN"
############DEFAULTS################
MAINPATH=$(dirname "$0")
LOGPATH=$MAINPATH/logs


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
        read COL < grep LOGOCOLOR "$MAINPATH"/settings/logocolor.txt
    else
        COL="$CBS"
    fi
############Tools###################
###function:menu
MAINMENU=(1:User_Tools
	2:File_Utilities
	3:Disk_Utilities
	4:Application_Log_Tools
	5:Apach_Tools
	6:Website_Tests
	7:Misc_Tools)

USERMENU=(1:Create_User:a_utility_to_create_user
	2:Disable_User:a_utility_to_disable_user
	3:List_Users:a_utility_to_list_users
	4:Main_Menu:main_menu)

LOGMENU=(1:listxdaysapachelogs:List_X_Days_Apache_Logs
	2:listxdayslumenlogs:List_X_Days_Lumen_Logs
	3:listxdayslogs:List_X_Days_Logs_In_Directories)

DISKMENU=(1:List_Disks_Above_Threshold:a_utility_to_find_disks_above_threshold
	2:Main_Menu:main_menu)

MISCMENU=(1:Password_Generator:a_utility_to_generate_5_random_password
	2:Main_Menu:main_menu)

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

	
############FUNCTIONS REFERENCE###############
source $MAINPATH/userfunctions.sh
source $MAINPATH/miscfunctions.sh

############MISC FUNCTIONS###############
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
}
function build_3col_menu {
	TERMINALTITLE=$1
	dash_calc
	for M in ${@:2}
	do
		A=(${M//:/ })
		echo -e $CYS${A[0]}$CE")"$CWHS${A[1]//_/}$CE
		
	done  |xargs -L3 |column -t
	

	echo -e $CYS"0)"$CE$CWHS"Exit"$CE
}
function build_menu {
	TERMINALTITLE=$1
	dash_calc
	for M in ${@:2}
	do
		A=(${M//:/ })
		echo -e $CYS${A[0]}$CE")"$CWHS${A[1]//_/}'-:'$CE$CLPS${A[2]//_/ }$CE
	done | column -s "-" -t
}
function main_options {

	
	case $1 in
		1)
		build_menu "User Tools" ${USERMENU[@]}
		read -p "Enter a number: " CHOICE
		user_options $CHOICE
		;;
		2)
		echo 'File Utilities'
		;;
		3)
		build_menu "Disk Tools" ${DISKMENU[@]}
		read -p "Enter a number: " CHOICE
		user_options $CHOICE
		;;
		4)
		echo 'Application Log Tools'
		;;
		5)
		echo 'Apache2 Tools'
		;;
		6)
		echo 'Website Test'
		;;
		7)
		build_menu "MISC Tools" ${MISCMENU[@]}
		read -p "Enter a number: " CHOICE
		msc_options $CHOICE
		;;
		0)
		echo 'Exiting'
		exit 0
		;;
	esac
}
function user_options {
	if [[ $1 = 1 ]]
	then
		fncreateuser 2> /dev/null
	elif [[ $1 = 2 ]]
	then
		fndisableuser 2> /dev/null

	elif [[ $1 = 3 ]]
	then 
		echo list users
	elif [[ $1 = 4 ]]
	then
		build_3col_menu "MAIN Menu" ${MAINMENU[@]}
		read -p 'Enter a number:' CHOICE
		main_options $CHOICE
	else
		echo invalid choice
	fi
	
	echo -e $CWHS$CE
	build_menu "User Tools" ${USERMENU[@]}
	read -p "Entere a number: " CHOICE
	user_options $CHOICE	
		
}
function disk_options{
	if [ $1 = 1 ]
	then
	elif [ $1 = 2 ]
	then
	else

	fi
}
function msc_options {
	if [[ $1 = 1 ]] 
	then
		fngeneratepassword5 2> /dev/null
	elif [[ $1 = 2 ]]
	then
		build_3col_menu "MAIN Menu" ${MAINMENU[@]}
		read -p 'Enter a number:' CHOICE
		main_options $CHOICE
	else
		echo invalid choice
	fi

	echo -e $CWHS$CE
	build_menu "Misc Tools" ${MISCMENU[@]}
	read -p "Enter a number: " CHOICE
	msc_options $CHOICE
}
#------------------- Main Code --------------------------
fn_banner
build_3col_menu "Main Menu" ${MAINMENU[@]}
read -p 'Enter a number:' CHOICE
main_options $CHOICE

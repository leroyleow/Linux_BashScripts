#!/bin/bash

# set -x # turn off debug
VERSION=1.0.0
AUTHOR="Leroy Leow"

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
MENUARRAY=(1:createuser:Create_User
	2:disableusers:Disable_User
	3:listusers:List_Users)

############FUNCTIONS###############
function banner {
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

for M in ${MENUARRAY[@]}
do
	A=(${M//:/ })
	#echo -e "$ClCYS ${A[0]})${A[2]//_/ }$CE"
	echo -e "${A[0]})${A[2]}"
done  |xargs -L3 |column -t
}

banner

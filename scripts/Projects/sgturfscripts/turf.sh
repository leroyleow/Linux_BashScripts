#!/bin/bash

# set -x # turn off debug
VERSION=1.0.0
cd
############DEFAULTS################
TURFPATH="$(pwd)/turfscripts"
export TURFPATH
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
        COL="$RS"
    fi

############FUNCTIONS###############
function banner() {
echo -e ""
echo -e "$COL ██████╗  █████╗  ██████╗███████╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ██╗$CE "     
echo -e "$COL ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗██║$CE"     
echo -e "$COL ██████╔╝███████║██║     █████╗  ██████╔╝██║   ██║██████╔╝   ██║   ███████║██║$CE"     
echo -e "$COL ██╔══██╗██╔══██║██║     ██╔══╝  ██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║$CE"     
echo -e "$COL ██║  ██║██║  ██║╚██████╗███████╗██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║███████╗$CE"
echo -e "$COL ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝$CE"
echo -e ""                                                                                  
echo -e "$COL ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗$CE"                                      
echo -e "$COL ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝$CE"                                      
echo -e "$COL ███████╗██║     ██████╔╝██║██████╔╝   ██║   $CE"                                      
echo -e "$COL ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   $CE"                                      
echo -e "$COL ███████║╚██████╗██║  ██║██║██║        ██║   $CE"                                      
echo -e "$COL ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   $CE"                                      
                                                                                  
                                                                                                    

}
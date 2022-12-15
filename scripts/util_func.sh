#!/bin/bash

#######################################
# Print a message in a given color.
# Arguments:
#   $1 = Color. eg: green, red
#   $2 = message
#######################################
function print_colour_status(){
    NO_COLOUR='\033[0m'
    case $1 in
        "passed") COLOUR='\033[0;32m' ;;
        "warning") COLOUR='\033[0;33m' ;;
        "failed") COLOUR='\033[0;31m' ;;
        "*") COLOUR='\033[0m' ;;
    esac

    echo -e "${COLOUR} $2 ${NO_COLOUR}"
    export retstatus=0
}

function log2file() {
    logfile="./logs/main.log"
    print_colour_status "" "${logfile:0:6}"

    if [ ! -f ${logfile} ]
    then
        logdir="${logfile:0:6}"
        if [ ! -d ${logdir} ]
        then
            print_colour_status "warning" "${logfile} not created. Creating now"
            mkdir -p ${logdir}
            print_colour_status "passed" "${logdir} created"
        fi
        touch ${logfile}
        print_colour_status "passed" "${logfile} created"
    fi
    
    echo "[$(date)]:${1}" >> ${logfile} 
    export retstatus=0
}
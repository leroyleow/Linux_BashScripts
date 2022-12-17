#!/bin/bash

function print(){
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

function adduser() {
    read -p "Key in new username: " username
    read -p "Key in new user password: " userpassword

    if [ -z $username ] || [ -z $userpassword]; then
        print "failed" "Empty username or password found."
        export ret=1
    fi
    sudo useradd "${username}"
    echo "${username}:${userpassword}" | sudo chpasswd # change user password
    print "passed" "User [${username}] is created. Please ask user with password"

    export ret=0
}

function deluser(){
    read -p "Key in username to delete: " username

    if [-z $username]; then
        print "failed" "Empty username found"
    fi
    sudo userdel "${username}"
    print "passed" "User [${username}] is deleted"
}


# ------ Main Code ------
HELP = "usage: $0 [-a] [-d] [--help]"
opts=":ad-:"
while getopts "$opts" optchar; do
    -)
        echo "options argument = ${OPTARG}"
        echo "options value = ${OPTIND}"
        case "${OPTARG}" in 
            help)
                val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
                ;;
            *)
                if [ "$OPTERR" != 1 ] || [ "${optspec:0:1}" = ":" ]; then
                    echo "Error parsing short flag: '-${OPTARG}'" >&2
                    exit 1
                fi
                ;;
        esac
    a)
        val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
        operation="addusr"
        ;;
    d)
        val="${!OPTIND}"; OPTIND=$(( $OPTIND + 1 ))
        operation="delusr"
        ;;
    h)
        echo "${HELP}" > &2
        exit 2
        ;;
    *)
        if [ "$OPTERR" != 1 ] || [ "${optspec:0:1}" = ":" ]; then
            echo "Error parsing short flag: '-${OPTARG}'" >&2
            exit 1
        fi
        ;;
done

# Do we have even one argument?
if [ -z "$1" ]; then
  echo "${HELP}" >&2
  exit 2
fi

case operation in
    "adduser") 
        adduser
        ;;
    "deluser")
        deluser
        ;;
    "*")
        echo "${HELP}" > &2
        exit 2      
esac;;
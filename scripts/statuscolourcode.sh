!#/bin/bash
function print_colour_status(){
    $NO_COLOUR='\033[0m'
    case $1 in
    "green") COLOUR='\033[0;32m' ;;
    "passed") COLOUR='\033[0;32m' ;;
    "red") COLOUR='\033[0;31m' ;;
    "failed") COLOUR='\033[0;31m' ;;
    "*") COLOUR='\033[0m' ;;

    echo -e "${COLOUR} $1 ${NO_COLOUR}"
}
#!/bin/bash
# Author: CheeKeong
# Date: 31/08/2023
# Description: This script will create user account
# Usage: disableuser-xarg

lastlog -n 90 | tail -n+2 | awk '{print $1}' | xarg -I{} usermod -K {}
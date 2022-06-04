#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Optimize for performance
# Dependencies: amdctl, ryzenadj

performance () {
    ryzenadj --stapm-limit=25000 --fast-limit=25000 --slow-limit=25000 --tctl-temp=90
    amdctl -p0 -v80
}

battery () {
    ryzenadj --stapm-limit=15000 --fast-limit=15000 --slow-limit=15000 --tctl-temp=65
}

info () {
    echo -e "################### INFO FROM RYZENADJ ###################\n"
    ryzenadj -i
    echo -e "\n################## INFO FROM AMDCTL ###################\n"
    amdctl -g
}

show_help () {
	cat <<EOF
Usage: mode.sh [options]
AVAILABLE OPTIONS:
  --batt        optimizations for battery saving
  --perf        optimizations for performance
  --info        report info
EOF
}

if [ "$UID" -eq "0" ]; then
    if [[ "$1" == "--batt" ]]; then
    	battery
    elif [[ "$1" == "--perf" ]]; then
    	performance
    elif [[ "$1" == "--info" ]]; then
    	info
    else
    	show_help
    fi
else
    echo "Root privileges are required!"
fi
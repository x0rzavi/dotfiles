#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Optimize for performance
# Dependencies: amdctl, ryzenadj

# MODEL: hp 15s-gr0009au
# PROCHOT: 80C

performance () {
    ryzenadj --stapm-limit=25000 --fast-limit=25000 --slow-limit=25000 \
    		--slow-time=128 --stapm-time=3600 --tctl-temp=77 \
    		--vrm-current=180000 --vrmmax-current=180000 \
    		--vrmsoc-current=180000 --vrmsocmax-current=180000 \
    		--min-gfxclk=1000 --max-performance
    echo 1 > /sys/devices/system/cpu/cpufreq/boost
    #amdctl -p0 -v124
    #amdctl -p1 -v96 -f102   #Default
    #amdctl -p2 -v102 -f98   #Default
}

battery () {
    ryzenadj --stapm-limit=15000 --fast-limit=15000 --slow-limit=15000 --tctl-temp=60
    #amdctl -p1 -v104 -f86
    #amdctl -p2 -v120 -f60
}

default () {
    ryzenadj --stapm-limit=15000 --fast-limit=25000 --slow-limit=20000 --tctl-temp=89 \
		--vrm-current=35000 --vrmmax-current=45000 --slow-time=5 --stapm-time=200
    #amdctl -p0 -v53
    #amdctl -p1 -v96 -f102
    #amdctl -p2 -v102 -f98
}

undervolt () {
    #amdctl -p0 -v124
    :
}

info () {
    printf '%s\n\n' "################### INFO FROM RYZENADJ ###################"
    ryzenadj -i
    #printf '%s\n\n' "\n################## INFO FROM AMDCTL ###################"
    #amdctl -g
}

show_help () {
	cat<<- EOF
	Usage: mode.sh [option]

	Available options:
	-b       optimize for battery saving
	-p       optimize for performance
	-u       undervolt p0 state only
	-d       revert to default configuration
	-i       print advanced info
	EOF
}

if [ "$(id -u)" -eq 0 ]
then 
	getopts bpudi opt
	case ${opt} in
		(b) battery;;
		(p) performance;;
		(u) undervolt;;
		(d) default;;
		(i) info;;
		(\?) show_help;;
	esac
else printf '%s\n' 'Root priveleges are required!'
fi

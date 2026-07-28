#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Maintenance procedure for btrfs
# Dependencies: btrfs-progs, timeshift (optional)

# Safer script
set -o errexit
set -o nounset
set -o xtrace
trap 'exit' INT

maintenance () {
	if [ "$(timeshift --version)" ]
	then timeshift --delete-all
	fi
	btrfs filesystem defragment -r /
    btrfs filesystem defragment -r /home
    btrfs balance start /
    btrfs scrub start /
}

if [ "$(id -u)" -eq 0 ]
then maintenance
else printf '%s\n' 'Root priveleges are required!'
fi
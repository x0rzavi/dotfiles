#!/usr/bin/env bash

# Safer script
trap "exit" INT
set -euox pipefail

# Author: https://github.com/x0rzavi
# Description: Maintenance procedure for btrfs
# Dependencies: btrfs-progs

maintenance () {
    timeshift --delete-all
    btrfs filesystem defragment -r /
    btrfs filesystem defragment -r /home
    btrfs balance start /
    btrfs scrub start /
}

if [ "$UID" -eq "0" ]; then
    maintenance
else
    echo "Root privileges are required!"
fi

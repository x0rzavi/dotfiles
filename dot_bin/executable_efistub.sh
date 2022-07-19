#!/usr/bin/env bash

# Safer script
trap "exit" INT
set -eo pipefail

# Author: https://github.com/x0rzavi
# Description: Generate EFISTUBs
# Dependencies: efibootmgr

# Assumptions:
# OS: Gentoo
# EFS partition: /dev/sda1
# EFS mountpoint: /efi
# EFS folder: /efi/EFI/Gentoo
# EFI folder mountpoint: /boot
# FS: ZFS=zroot/root/gentoo
# Conventional file naming
# No backup initramfs
# No initramfs for .old kernels

# Function to generate EFI boot entry
generate () {
    # IMPORTANT VARIABLES
    loader="\\EFI\\Gentoo\\${kernel_file}"
    initrd="\\EFI\\Gentoo\\${initramfs_file}"
    root="ZFS=zroot/root/gentoo"
    kernel_flags="ro mitigations=off"
    unicode="root=${root} ${kernel_flags} initrd=${initrd}"

    echo -e "***** Generating boot entry for \"${kernel_ver}\" *****\n"
    efibootmgr \
    --disk /dev/sda1 \
    --part 1 \
    --create \
    --label "${kernel_ver}" \
    --loader "${loader}" \
    --unicode "${unicode}" \
    --verbose && echo ""
}

# Function to regenerate EFI boot entry if it exists already
force_generate () {
    boot_entry=$(efibootmgr | env grep "${kernel_ver}$")
    boot_num=$(echo ${boot_entry} | env cut -d"*" -f1 | env sed 's|Boot||')
    echo -e "***** Forcefully deleting boot entry for \"${kernel_ver}\" *****\n"
    efibootmgr -b ${boot_num} -B && echo ""
    generate
}

# Function to delele invalid EFI boot entries if kernel doesn't exist
delete_invalid () {
	# Delele *old* files too
	rm -fr /boot/*old*
    # Get all gentoo boot entries into array
    boot_entry=($(efibootmgr | env grep "gentoo" | sed 's|* |*|'))
    for i in ${boot_entry[@]}; do
        kernel_ver=$(echo ${i} | env cut -d"*" -f2)
        boot_num=$(echo ${i} | env cut -d"*" -f1 | sed 's|Boot||')

        # Delete if corresponding kernel doesn't exist
        if ! [[ -f "/boot/vmlinuz-${kernel_ver}" ]] ; then
            echo -e "***** Deleting invalid boot entry for \"${kernel_ver}\" *****\n"
            efibootmgr -b ${boot_num} -B && echo ""
        fi
    done
}

# Main loop to check all kernel images
main () {
    # Get list of all kernel images
    for file in /boot/vmlinuz* ; do

        # Get kernel image versions and predefine corresponding initramfs file names
        # to check for presence later
        kernel_file=$(echo ${file} | env sed 's|/boot/||' | env grep -v '\.old')
        kernel_ver=$(echo ${kernel_file} | env sed 's|vmlinuz-||')
        initramfs_file="initramfs-${kernel_ver}.img"

        # Only proceed if corresponding initramfs file exists else notify absence
        if [[ -f "/boot/${initramfs_file}" ]] ; then

            # Check if boot entry for kernel already exists else generate entry
            if [[ $(efibootmgr | env grep "${kernel_ver}$") ]] ; then
        
                # Forcefully regenerate entries if correct flags were provided
                # else just notify that entry exists
                if [[ "$1" = '-f' ]] || [[ "$1" = '--f' ]]; then
                    force_generate
                else
                    echo -e "***** \"${kernel_ver}\" already found in boot menu! *****\n"
                fi
            else
                generate
            fi
        else
            echo -e "***** Matching \"${initramfs_file}\" not found for \"${kernel_file}\"! *****\n"
        fi
    done
}

show_help () {
	cat <<EOF
Usage: efistub.sh [options]

AVAILABLE OPTIONS:
  -g | --generate     generate applicable EFI entries
  -f | --force        forcefully regenerate all EFI entries
  -d | --del-invalid  delete invalid EFI entries [Gentoo]
  -h | --help         show help
EOF
}

# Only proceed if executed as root
if [ "$UID" -eq "0" ]; then
    # Check for arguments
    if [[ "$1" == "--force" ]] || [[ "$1" == "-f" ]] ; then
        main $1
    elif [[ "$1" == "--del-invalid" ]] || [[ "$1" == "-d" ]]; then
        delete_invalid
    elif [[ "$1" == "--generate" ]] || [[ "$1" == "-g" ]]; then
        main
    elif [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
        show_help
    else
        show_help
    fi
else
    echo "Root privileges are required!"
fi

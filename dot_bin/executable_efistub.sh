#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Generate EFISTUBs
# Dependencies: efibootmgr

# Safer script
set -o errexit
set -o nounset
# set -o xtrace
trap 'exit' INT

# function to generate EFI entry
generate_entry () {
	# Parameters $1:Kernel version / $2:Kernel filename / $3:Initramfs filename

	# Important variables
	disk='/dev/sda1'
	part='1'
	efs_folder="\\EFI\\Gentoo\\"
	root='ZFS=zroot/root/gentoo'
	kernel_flags='ro'
	loader="${efs_folder}$2"
	initrd="${efs_folder}$3"
	condensed="root=${root} ${kernel_flags} initrd=${initrd}"

	set -o xtrace && efibootmgr \
		--create \
		--disk "${disk}" \
		--part "${part}" \
		--label "$1" \
		--loader "${loader}" \
		--unicode "'${condensed}'" && set +o xtrace && \
	printf '%s\n\n' ">>>>> Generated boot entry for \"$1\""
}

# Function to delete specific EFI entry
delete_entry () {
	# Parameters $1:Kernel version / $2:Kernel filename

	boot_entry=$(efibootmgr -u | grep "$2")
	boot_num=$(printf '%s' "${boot_entry}" | cut -d' ' -f1 | sed 's|Boot||;s|*||')
	set -o xtrace && efibootmgr \
		--bootnum "${boot_num}" \
		--delete-bootnum \
		--unicode && set +o xtrace && \
	printf '%s\n\n' ">>>>> Forcefully deleted boot entry for \"$1\""
}

# Function to delete all invalid entries
# assuming 'Gentoo'
delete_invalid () {
	IFS="$(printf '\n')"
	efibootmgr --unicode | grep 'gentoo' | cut -f1 | sed 's|* | |;s|Boot||' | \
	while read -r boot_entry
	do
		boot_num=$(printf '%s' "${boot_entry}" | cut -d' ' -f1)
		kernel_ver=$(printf '%s' "${boot_entry}" | cut -d' ' -f2)

		if ! [ -f "/boot/vmlinuz-${kernel_ver}" ]
		then
			set -o xtrace && efibootmgr \
				--bootnum "${boot_num}" \
				--delete-bootnum \
				--unicode && set +o xtrace && \
			printf '%s\n\n' ">>>>> Deleted invalid boot entry for \"${kernel_ver}\""
		fi

	done
}

main () {
	for file in /boot/vmlinuz*
	do
		# Don't process files with '.old' suffix
		if ! printf '%s' "${file}" | grep -q 'old$'
		then
			kernel_file=$(printf '%s' "${file}" | sed 's|/boot/||')
			kernel_ver=$(printf '%s' "${kernel_file}" | sed 's|vmlinuz-||' )
			initramfs_file="initramfs-${kernel_ver}.img"
			
			# Proceed further only if initramfs present
			if [ -f "/boot/${initramfs_file}" ]
			then

				# Test if EFI entry doesn't exist?
				if [ "$1" = '-g' ] && ! efibootmgr | grep -q "${kernel_file})" || [ "$1" = '-f' ] && ! efibootmgr | grep -q "${kernel_file})"
				then
					generate_entry "${kernel_ver}" "${kernel_file}" "${initramfs_file}"
				# Test if EFI entry exists? and needs to be forcefully regenerated
				elif [ "$1" = '-f' ] && efibootmgr | grep -q "${kernel_file})"
				then
					delete_entry "${kernel_ver}" "${kernel_file}"
					generate_entry "${kernel_ver}" "${kernel_file}" "${initramfs_file}"
				# Test if EFI entry exists?
				elif [ "$1" = '-g' ] && efibootmgr | grep -q "${kernel_file})"
				then
					printf '%s\n\n' ">>>>> \"${kernel_ver}\" entry already found in boot menu !"
				fi

			else printf '%s\n\n' ">>>>> Initramfs file \"${initramfs_file}\" missing for kernel \"${kernel_file}\" !"
			fi

		else continue
		fi
	done
}

show_help () {
	cat<<- EOF
	Usage: efistub.sh [option]

	Available options:
	-g    delete invalid entries & generate new entries
	-f    delete invalid entries & forcefully regenerate new+old entries
	EOF
}

if [ "$(id -u)" -eq 0 ]
then
	getopts gfh opt
	case ${opt} in
		(g) delete_invalid && main "-${opt}";;
		(f) delete_invalid && main "-${opt}";;
		(h) show_help;;
		(\?) show_help;;
	esac
else printf '%s\n' 'Root priveleges are required!'
fi
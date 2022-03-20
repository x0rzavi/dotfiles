#!/usr/bin/env bash

# Exit mechanism
trap "exit" INT
set -e

# Author: https://github.com/x0rzavi
# Description: Download my custom xanmod build from github and populate necessary directories
# Dependencies: aria2, 7z

# Variables
directory=$(pwd)

rm -rf $directory/tmpdir
mkdir -p $directory/tmpdir
cd $directory/tmpdir

kernel_package () {
	download_link=$(curl -s https://api.github.com/repos/r3tr0w0lf/gentoo-kernel/releases/latest \
					| grep "browser_download_url.*linux.7z" | cut -d : -f 2,3)
	echo $download_link | xargs aria2c -x16
	7z x $directory/tmpdir/linux*.7z -o$directory/tmpdir/
	rm -rf $directory/tmpdir/linux*.7z
	release_tag=$(echo $download_link | cut -d / -f 8)
	mv $directory/tmpdir/linux-* $directory/tmpdir/$release_tag
}

kernel_install () {
	echo -e "\n\n\nPlease input your root password to proceed for moving folder:\n"
	sudo mv $directory/tmpdir/$release_tag /usr/src/
	echo -e "\nLinux Kernel Source Installation Was Successful !!"
	echo -e "\nNow Proceed With The Usual Kernel Installation Procedure:"
	echo -e "# eselect kernel list"
	echo -e "# make install"
	echo -e "# make modules_install"
	echo -e "# emerge @module-rebuild"
	echo -e "# dracut --regenerate-all --force --quiet"
	echo -e "# grub-mkconfig -o /boot/grub/grub.cfg"
	rm -rf $directory/tmpdir
}

kernel_package
kernel_install

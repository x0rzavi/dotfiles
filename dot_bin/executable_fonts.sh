#!/usr/bin/env bash

# Exit mechanism
trap "exit" INT

# Description: Install my favourite fonts
# Dependencies: fontforge, aria2

# Variables
directory=$(pwd)

rm -fr $directory/tmpdir
mkdir -p $directory/tmpdir
cd $directory/tmpdir

apple_fonts () {
	aria2c -x16 "https://github.com/x0rzavi/apple-fonts-nerd-patched/releases/download/v1/AppleFontsNerdPatched.7z"
	7z x "AppleFontsNerdPatched.7z" -o$directory/tmpdir
	rm -rf AppleFontsNerdPatched.7z
}

jetbrainsmono () {
	mkdir -p $directory/tmpdir/JetBrainsMono
	
	curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest \
	| grep "browser_download_url.*JetBrainsMono.zip" | cut -d : -f 2,3 \
	| xargs aria2c -x16
	7z x "JetBrainsMono.zip" -o$directory/tmpdir/JetBrainsMono
	rm -rf JetBrainsMono.zip
	
}

install_fonts () {
	apple_fonts
	#jetbrainsmono
	echo -e "\n\n\nPlease input your root password to proceed for copying:\n"
	sudo mv $directory/tmpdir/* /usr/share/fonts/
	fc-cache --really-force --verbose
	rm -rf $directory/tmpdir
}

install_fonts

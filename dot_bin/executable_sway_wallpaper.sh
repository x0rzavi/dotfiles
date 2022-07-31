#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Set random wallpaper from unsplash.com fetched through unsplash.it
# Dependencies: sway, wget

# Variables
wallpapers_path="${HOME}/Pictures/Wallpapers"

wallpaper_set () {
	cd "${wallpapers_path}" || exit 1
	tag="$(date +%s)"
	random="$(hexdump -n 2 -e '/2 "%u"' /dev/urandom)"
	wget "https://picsum.photos/seed/${random}/3840/2160" --quiet -O "${tag}.jpg"
	if [ -s "${tag}.jpg" ]
	then
		cp "${tag}.jpg" wallpaper.jpg
		#swaymsg output 'eDP-1' bg "${wallpapers_path}/wallpaper.jpg" fill
	else rm -f "${tag}.jpg"
	fi
}

wallpaper_set

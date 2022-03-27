#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Set random wallpaper from unsplash.com fetched through unsplash.it
# Dependencies: sway, aria2c

# Variables
wallpapers_path=$HOME/Pictures/unsplash

wallpaper_set () {
	cd $wallpapers_path
	tag=$(date +%s)
	wget "https://picsum.photos/3840/2160" --quiet -O $tag.jpg
	cp $tag.jpg wallpaper.jpg
	swaymsg output "eDP-1" bg $wallpapers_path/wallpaper.jpg fill
}

wallpaper_set

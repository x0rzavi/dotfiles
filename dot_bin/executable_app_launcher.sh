#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Application launcher with bemenu
# Dependencies: bemenu, gtk4, Lucide icons
# Theme: Catppuccin

# Variables
black='#1E1E2E'
sky='#89DCEB'
mauve='#CBA6F7' 
peach='#FAB387'
green='#A6E3A1'

for file in /usr/share/applications/*.desktop
do files="${files}${file}\n"
done
printf '%b' "${files}" \
	| sed 's|/usr/share/applications/||;s|.desktop$||' \
	| bemenu \
	--ignorecase \
	--list 5 \
	--prefix '' \
	--prompt 'LAUNCH ' \
	--fork \
	--line-height 25 \
	--cw 3 \
	--fn 'Iosevka Nerd Font Bold' \
	--tb "${black}" \
	--tf "${peach}" \
	--fb "${black}" \
	--ff "${mauve}" \
	--nb "${black}" \
	--nf "${peach}" \
	--hb "${black}" \
	--hf "${green}" \
	--ab "${black}" \
	--af "${sky}" \
	--bdr "${mauve}" \
	--cb "${black}" \
	--cf "${mauve}" \
	| xargs gtk4-launch
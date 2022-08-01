#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Launch apps natively on wayland
# Derived: https://github.com/jbuchermn/newm/blob/master/doc/tips_and_tricks.md

flags='--ozone-platform=wayland \
	--enable-features=WebRTCPipeWireCapturer \
	--enable-gpu \
	--ignore-gpu-blocklist \
	--enable-gpu-rasterization \
	--enable-zero-copy \
	--disable-gpu-driver-bug-workarounds \
	--enable-features=VaapiVideoDecoder \
	--disable-software-rasterizer \
	--js-flags='--max-old-space-size=5120''

$1 $flags $2
#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Script to open electron apps natively with wayland
# Dependencies: none
# Derived: https://github.com/jbuchermn/newm/blob/master/doc/tips_and_tricks.md

flags='--ozone-platform-hint=auto \
        --enable-features=WebRTCPipeWireCapturer \
        --enable-gpu \
        --ignore-gpu-blocklist \
        --enable-gpu-rasterization \
        --enable-zero-copy \
        --disable-gpu-driver-bug-workarounds \
        --enable-features=VaapiVideoDecoder \
        --disable-software-rasterizer \
        --start-maximized \
        --js-flags="--max-old-space-size=5120"'

$1 $flags $2

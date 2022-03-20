#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Launch sway
# Dependencies: sway
# Derived: https://blog.realogs.in/getting-secrets-to-work-with-sway/

# Keyring daemon for secrets
eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh | sed 's/^\(.*\)/export \1/g')

# Launch sway
sway

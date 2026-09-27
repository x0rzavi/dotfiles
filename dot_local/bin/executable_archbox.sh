#!/usr/bin/env bash
# Usage: archbox.sh        -> root shell (for pacman)
#        archbox.sh avi    -> shell as user "avi"
ROOTFS="$HOME/Avi/containers/arch-rootfs/root.x86_64"
NAME="${1:-root}"

if [ "$NAME" = root ]; then
  ID_FLAG="-0"
  HOME_DIR=/root
else
  IDS=$(awk -F: -v u="$NAME" '$1 == u { print $3 ":" $4 }' "$ROOTFS/etc/passwd")
  [ -z "$IDS" ] && {
    echo "no such user in container: $NAME" >&2
    exit 1
  }
  ID_FLAG="-i $IDS"
  HOME_DIR="/home/$NAME"
fi

# Binds follow proot's -S alias, plus /etc/localtime from -R.
# -R is avoided: it binds the host's /etc/passwd and /etc/group.
exec proot --kill-on-exit $ID_FLAG -r "$ROOTFS" \
  -b /dev -b /proc -b /sys -b /tmp \
  -b /etc/host.conf -b /etc/hosts -b /etc/nsswitch.conf \
  -b /etc/localtime \
  -b "$HOME" \
  -w "$HOME_DIR" \
  /usr/bin/env -i HOME="$HOME_DIR" HOST_HOME="$HOME" USER="$NAME" TERM="$TERM" \
  /bin/fish -l

#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Launch sway
# Dependencies: sway
# Derived: https://blog.realogs.in/getting-secrets-to-work-with-sway/
# Derived: https://github.com/uditkarode/dots/blob/master/scripts/swaylaunch

# NOTES (Regarding Gentoo)
# 1. gnome-keyring-daemon is started by PAM with arguments "--daemonize --login" if 
# proper PAM setup is done following https://wiki.gnome.org/Projects/GnomeKeyring/Pam
# `These arguments tells the daemon it is being run by PAM. It reads all of stdin 
# (including any newlines) as a login password and DOES NOT COMPLETE ACTUAL INITIALIZATION. 
# The daemon SHOULD LATER BE INITIALIZED with a gnome-keyring-daemon --start invocation.`
#
# 2. The default login keyring should automatically be created with the current user 
# password if it doesn't exist already. With these assumptions, it is safe to conclude 
# that if PAM setup is done properly, the login keyring should automatically be unlocked 
# on user login.
#
# 3. Apparently, this pre-initialization process gets shortly killed (locking the default
# login keyring again) if a dbus user session is not created soon enough. Otherwise it 
# remains alive until the dbus session closes.
#
# 4. Assuming proper dbus user session services exist to fully initialize the 
# gnome-keyring-daemon with arguments "--start" and optionally "--components=...", it is 
# not necessary to invoke these commands explicitly within a dbus user session.
#
# 5. Services like "org.freedesktop.impl.portal.Secret.service" automatically execs the 
# required command to fully initialize the daemon on dbus user session startup (Editing 
# arguments maybe necessary to include additional components), the only caveat being 
# environment vars provided by the daemon to be manually setup ("$SSH_AUTH_SOCK", 
# "$GNOME_KEYRING_CONTROL").
#
# 6. In all cases, the final initialization must be done within a dbus user session with 
# proper environment variables declaring its existence. "dbus-run-session" is preferred over 
# "dbus-launch" since dbus-launch doesn't close the user session created by default and 
# is kind of deprecated.
#
# 7. Any further invocation of "gnome-keyring-daemon --start" will only cause it to print 
# its necessary environment variables.
#
# 8. This script is preferred to be executed with "exec", since exiting the wm kills 
# gnome-keyring-daemon entirely, requiring relogin to use auto unlocking feature. Use 
# "exec sway_enter.sh", given "sway_enter.sh" is already in $PATH

# xdg-desktop-portal-wlr quirks
export XDG_CURRENT_DESKTOP=sway

# dbus starts gnome-keyring-daemon service, so apply necessary envs
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

# Complete gnome-keyring-daemon initialization for secrets
#eval $(gnome-keyring-daemon --start | /bin/sed 's/^\(.*\)/export \1/g')

# Launch sway within a dbus user session
dbus-run-session -- sway

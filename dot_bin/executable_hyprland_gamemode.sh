#!/usr/bin/env dash
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | /bin/sed -n '2p' | awk '{print $2}')
if [ $HYPRGAMEMODE = 1 ] ; then
    hyprctl --batch "\
        keyword decoration:rounding 0;\
        keyword decoration:inactive_opacity 1;\
        keyword decoration:blur 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:dim_inactive 0;\
        keyword animations:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1"
    exit
fi
hyprctl reload && notify-send 'Hyprland' '\nConfig reverted to default!'

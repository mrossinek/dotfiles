#!/bin/sh
greenclip clear
greenclip daemon &
dunst &
mpDris2 &
# snixembed --fork  # TODO figure out if this is still needed
unclutter -b
picom -b
hsetroot -solid '#303030'
conky -c ~/.config/conky/conky_left.conf
conky -c ~/.config/conky/conky_middle.conf
conky -c ~/.config/conky/conky_right.conf
sleep 1

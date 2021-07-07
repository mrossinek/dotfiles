#!/bin/sh
greenclip clear
greenclip daemon &
dunst &
mpDris2 &
# snixembed --fork  # TODO figure out if this is still needed
unclutter -b
picom -b
feh --bg-fill --randomize ~/Pictures/Wallpapers/* &
sleep 1

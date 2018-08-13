#!/bin/sh
x_pos=$(xrandr | grep -o 'current [0-9]*\ x' | sed 's/[a-z ]//g')
x_pos=$(( $x_pos - 1350 ))
(
echo "Music Controls"
conky -c ~/.conky/buttons/music.conkyrc
) | dzen2 -p -x $x_pos -y 20 -w 330 -l 3 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

#!/bin/sh
x_pos=$(xrandr | grep -o 'current [0-9]*\ x' | sed 's/[a-z ]//g')
x_pos=$(( $x_pos - 300 ))
(
echo "Upcoming Events"
khal list
) | dzen2 -p -x $x_pos -y 20 -w 290 -l 10 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button1=exit;button3=exit'

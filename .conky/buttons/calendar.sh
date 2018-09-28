#!/bin/sh
x_pos=$(xrandr | grep -o 'current [0-9]*\ x' | sed 's/[a-z ]//g')
x_pos=$(( $x_pos - 300 ))
cnt=$(khal list 2>/dev/null | wc -l)
cnt=$(( $cnt<15?$cnt:15 ))
(
echo "Upcoming Events"
khal list 2>/dev/null | head -n $cnt
) | dzen2 -p -x $x_pos -y 20 -w 290 -l $cnt \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button1=exit;button3=exit'

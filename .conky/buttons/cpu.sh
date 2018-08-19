#!/bin/sh
x_pos=$(xrandr | grep -o 'current [0-9]*\ x' | sed 's/[a-z ]//g')
x_pos=$(( $x_pos - 800 ))
(
echo "Top 10 CPU consumers"
ps aux | sort -nrk 3,3 | head -10
) | dzen2 -p -x $x_pos -y 20 -w 600 -l 10 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

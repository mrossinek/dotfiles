#!/bin/sh
x_pos=$(xrandr | grep -o 'current [0-9]*\ x' | sed 's/[a-z ]//g')
x_pos=$(( $x_pos - 500 ))
cnt=$(task +PENDING count)
cnt=$(( $cnt + 3 ))
(
echo "Open Tasks"
task next 2>/dev/null
) | dzen2 -p -x $x_pos -y 20 -w 490 -l $cnt \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button1=exit;button3=exit'

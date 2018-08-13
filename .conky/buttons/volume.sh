#!/bin/sh
x_pos=$(xrandr | grep -o 'current [0-9]*\ x' | sed 's/[a-z ]//g')
x_pos=$(( $x_pos - 1000 ))
(
echo "^fg(\#FFFFFF)
 ^ca(1,amixer set PCM -M 2%-)^fn(Font Awesome 5 Free:style=Solid:size=9)^fn()^ca() \
 ^ca(1,amixer set PCM toggle)^fn(Font Awesome 5 Free:style=Solid:size=9)^fn()^ca() \
 ^ca(1,amixer set PCM -M 2%+)^fn(Font Awesome 5 Free:style=Solid:size=9)^fn()^ca() "
) | dzen2 -p -x $x_pos -y 20 -w 100 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

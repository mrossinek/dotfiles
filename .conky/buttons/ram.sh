#!/bin/sh
eval $(xdotool getmouselocation --shell)
width=600
x_pos=$(( $X - width + 50 ))
(
echo "Top 10 RAM consumers"
ps aux --sort -%mem | head -10
) | dzen2 -p -x $x_pos -y 20 -w $width -l 10 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

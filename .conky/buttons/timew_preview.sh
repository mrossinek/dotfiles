#!/bin/sh
eval $(xdotool getmouselocation --shell)
width=220
x_pos=$(( $X - width ))
(
echo "Timewarrior"
timew
) | dzen2 -p -x $x_pos -y 20 -w $width -l 5 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button1=exit;button3=exit'

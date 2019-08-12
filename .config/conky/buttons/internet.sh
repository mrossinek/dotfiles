#!/bin/sh
eval $(xdotool getmouselocation --shell)
width=450
x_pos=$(( $X - width + 50 ))
(
echo "Networking info"
conky -c ~/.config/conky/buttons/internet.conkyrc
) | dzen2 -p -x $x_pos -y 20 -w $width -l 1 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

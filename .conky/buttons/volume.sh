#!/bin/sh
eval $(xdotool getmouselocation --shell)
width=450
x_pos=$(( $X - width + 50 ))
(
echo "Music Controls"
conky -c ~/.conky/buttons/music.conkyrc
) | dzen2 -p -x $x_pos -y 20 -w $width -l 4 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

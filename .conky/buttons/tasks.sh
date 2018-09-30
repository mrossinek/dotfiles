#!/bin/sh
eval $(xdotool getmouselocation --shell)
width=800
x_pos=$(( $X - width + 50 ))
cnt=$(task +PENDING count)
cnt=$(( $cnt + 3 ))
cnt=$(( $cnt<15?$cnt:15 ))
(
echo "Open Tasks"
task next 2>/dev/null | head -n $cnt
) | dzen2 -p -x $x_pos -y 20 -w $width -l $cnt \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button1=exit;button3=exit'

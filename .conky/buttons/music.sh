#!/bin/sh
eval $(xdotool getmouselocation --shell)
width=600
x_pos=$(( $X - width + 50 ))
cnt=$(mpc playlist | wc -l)
cnt=$(( $cnt<60?$cnt:60 ))
(
#echo "Music Controls"
#conky -c ~/.conky/buttons/music.conkyrc
echo "MPC Playlist"
mpc playlist | nl | head -n $cnt
) | dzen2 -p -x $x_pos -y 20 -w $width -l $cnt \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

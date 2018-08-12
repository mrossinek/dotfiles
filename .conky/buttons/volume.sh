#!/bin/sh
(
echo "^fg(\#FFFFFF)
 ^ca(1,amixer set PCM -M 2%-)^fn(Font Awesome 5 Free:style=Solid:size=9)^fn()^ca() \
 ^ca(1,amixer set PCM toggle)^fn(Font Awesome 5 Free:style=Solid:size=9)^fn()^ca() \
 ^ca(1,amixer set PCM -M 2%+)^fn(Font Awesome 5 Free:style=Solid:size=9)^fn()^ca() "
) | dzen2 -p -x 930 -y 20 -w 100 \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button3=exit'

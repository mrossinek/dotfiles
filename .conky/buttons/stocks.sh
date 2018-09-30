#!/bin/sh
eval $(xdotool getmouselocation --shell)
width=400
x_pos=$(( $X - width + 50 ))
cnt=$(cat ~/.stocks/prices.txt | wc -l)
(
echo "Current Stock prices"
cat ~/.stocks/prices.txt
) | dzen2 -p -x $x_pos -y 20 -w $width -l $cnt -sa l -ta c \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button1=exit;button3=exit'

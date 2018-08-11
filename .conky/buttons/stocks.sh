#!/bin/sh
(
echo "Current Stock prices"
cat ~/.stocks/prices.txt
) | dzen2 -p -x 1600 -y 20 -w 295 -l 11 -sa l -ta c \
        -bg "#1c1c1c" \
        -e 'onstart=uncollapse;button1=exit;button3=exit'

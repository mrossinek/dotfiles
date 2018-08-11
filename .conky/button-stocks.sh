#!/bin/sh
(
echo "Current Stock prices"
cat ~/.conky/stock-prices.txt
) | dzen2 -p -x 1600 -y 20 -w 300 -l 11 -sa l -ta c \
    -e 'onstart=uncollapse;button1=exit;button3=exit'

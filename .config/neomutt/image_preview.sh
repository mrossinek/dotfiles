#!/bin/sh

# determine size of terminal
height=`stty size | awk 'BEGIN {FS = " "} {print $1;}'`
width=`stty size | awk 'BEGIN {FS = " "} {print $2;}'`

# display image / offset with mutt bar
echo -e "2;3;\n0;1;210;20;$((width*7-250));$((height*14-100));0;0;0;0;$1\n4;\n3;" | /usr/lib/w3m/w3mimgdisplay

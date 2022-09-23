if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx -- -ardelay 250 -arinterval 12 -f 0 -a 2 -t 0 -dpi 120
fi

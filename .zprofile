if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx -- -ardelay 300 -f 0 -a 2 -t 0
fi

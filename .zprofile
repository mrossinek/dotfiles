export EDITOR=nvim
export BROWSER=xdg-open

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx -- -ardelay 300 -arinterval 25 -f 0 -a 2 -t 0 -dpi 120
fi

export EDITOR=nvim
if [[ $(uname) == 'Darwin' ]]; then
    export BROWSER=open
else
    export BROWSER=xdg-open
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx -- -ardelay 300 -arinterval 25 -f 0 -a 2 -t 0
fi

#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export NO_AT_BRIDGE=1
export _JAVA_AWT_WM_NONREPARENTING=1
export WINIT_HIDPI_FACTOR=1

eval $(ssh-agent)
greenclip clear
greenclip daemon &
dunst &
mpDris2 &
libinput-gestures-setup start
xbindkeys
unclutter -b
picom -b  # fixes tearing issues when using the modesetting driver
hsetroot -solid "#303030"  # https://wiki.archlinux.org/index.php/Picom#Unable_to_change_the_background_color_with_xsetroot
kitty zsh -ic 'tmux' &
qutebrowser &
snixembed --fork
stalonetray &
conky -c ~/.config/conky/conky_left.conf
conky -c ~/.config/conky/conky_middle.conf
conky -c ~/.config/conky/conky_right.conf
exec xmonad

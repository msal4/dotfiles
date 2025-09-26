#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
export DISPLAY=:0

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

SESSION=dwm

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

dwmstat &

# set the scale if DP-1 connected
has_external_monitor=$(xrandr --listmonitors | grep "DP-1")

if [ -n "$has_external_monitor" ]; then
	xrandr --output DP-1 --scale 0.75x0.75 --primary --dpi 212
	xrandr --output DP-2 --off
fi

dbus-update-activation-environment --all
dbus-launch ssh-agent dwm

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

# merge in defaults and keymaps
#
if [ -f "$HOME/.Xresources" ]; then
    xrdb -merge "$HOME/.Xresources"
fi

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

dwmstat > ~/.dwmstat.log &

external_monitor=$(xrandr --listmonitors | grep -ioE "HDMI-[0-9]+|DP-1" | uniq)
internal_monitor=$(xrandr --listmonitors | grep -ioE "DP-2" | uniq)

if [ -f ".screenlayout/3monitor.sh" ] && [ "$num_monitors" -eq 3 ]; then
	./.screenlayout/3monitor.sh
elif [ -n "$external_monitor" ]; then
	xrandr --output $external_monitor --mode 2560x1440 --primary --scale 1x1 --dpi 212 --output $internal_monitor --off
elif [ -n $internal_monitor ]; then
	xrandr --output $internal_monitor --scale 0.5x0.5
fi

feh --bg-fill ~/Pictures/background.jpg &

export XCOMPOSEFILE=$HOME/.XCompose

setxkbmap -option compose:lwin,compose:ralt

dbus-update-activation-environment --all

dbus-launch ssh-agent dwm

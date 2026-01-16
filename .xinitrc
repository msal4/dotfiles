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
caffeine start &

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
(gpg --decrypt ~/.password-store/github/msal4.gpg >/dev/null 2>&1) &
( sleep 2 && kitty --class gpg-unlock -e sh -c "gpg --decrypt ~/.password-store/github/msal4.gpg >/dev/null" ) &

# set the scale if DP-1 connected
external_monitor=$(xrandr --listmonitors | grep -ioE "HDMI-[0-9]+|DP-1" | uniq)

if [ -n "$external_monitor" ]; then
	xrandr --output $external_monitor --primary --output DP-2 --off
fi

feh --bg-fill ~/Pictures/chandler-chen-aEJVd7WUjf8-unsplash.jpg &

export XCOMPOSEFILE=$HOME/.XCompose

setxkbmap -option compose:lwin,compose:ralt

dbus-update-activation-environment --all

dbus-launch ssh-agent dwm

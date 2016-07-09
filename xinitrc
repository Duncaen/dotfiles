#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# set the random wallpaper as early as possible
feh --recursive --randomize --bg-fill --no-fehbg ~/.wallpaper

if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Load local .Xresources
xrdb -merge $HOME/.Xresources

# start pulseaudio -.-
start-pulseaudio-x11 &

xset -b
xrandr --dpi 96 &
setxkbmap de &
sct 4400

runsvdir -P $HOME/service.x 'log: ...........................................................................................................................................................................................................................................................................................................................................................................................................'

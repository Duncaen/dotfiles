#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
 for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# start pulseaudio -.-
start-pulseaudio-x11 &

# keyboard layout
setxkbmap de &

xset +fp ~/.fonts/ &
xset +fp /usr/share/fonts/misc/ &
xset fp rehash &

# nobeep
xset -b

xrandr --dpi 92 &

# hide cursor
unclutter -root -visible -jitter 10 -idle 5 &

# statusbar
repos/go-dwmstatus/go-dwmstatus &

while true; do
  # Full logging
  #dwm 2> ~/log/dwm.log
  # No logging
  dwm >/dev/null 2>&1
done

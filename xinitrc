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
# start-pulseaudio-x11 &

xset -b
xrandr --dpi 96 &
setxkbmap de &
sct 4400

if [ "$(hostname)" = "fly" ]; then
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
	xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
	xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95
fi

exec $STARTUP runsvdir -P $HOME/service.x 'log: ...........................................................................................................................................................................................................................................................................................................................................................................................................'

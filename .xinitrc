#!/bin/sh

# Load X resources
[[ -f ~/.Xresources  ]] && xrdb -merge -I$HOME ~/.Xresources

# Background
~/.fehbg &

# Compositor
picom &

# Notifications (optional)
# dunst &

# Mouse cursor
xsetroot -xcf /usr/share/icons/whiteglass/cursors/left_ptr 32

# Custom scripts
export PATH=$PATH:/home/connor/.local/src/scripts

# HiDPI scaling
export GDK_SCALE=2
export GDK_DPI_SCALE=1
export QT_SCALE_FACTOR=2

# Start status bar
dwmblocks &

# Start dwm inside a DBus session
exec dbus-run-session dwm
# exec dwm


#!/bin/sh

desired_classname="cmatrix"
window_id=$(xdotool search --class "$desired_classname" | head -n 1)

if [ -n "$window_id" ]; then
	sleep 0
else
    echo "running"
	alacritty --class cmatrix -e cmatrix -C white -u 9 
fi

item=$(xdo id -N cmatrix)
hidden=$(bspc query -T -n $item | jq .hidden)

if [ "$hidden" = "false" ]; then
    bspc node "$item" -g hidden=on
else
    bspc node "$item" -g hidden=off
    bspc node "$item" -f
fi

    echo $hidden

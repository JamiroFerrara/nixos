#!/bin/sh

/home/stiwie/.scripts/bspwm/winhide-all.sh

desired_classname="htop"
window_id=$(xdotool search --class "$desired_classname" | head -n 1)

if [ -n "$window_id" ]; then
	sleep 0
else
    echo "running"
	alacritty --class htop -e htop 
fi

item=$(xdo id -N htop)
hidden=$(bspc query -T -n $item | jq .hidden)

if [ "$hidden" = "false" ]; then
    bspc node "$item" -g hidden=on
else
    bspc node "$item" -g hidden=off
    bspc node "$item" -f
fi

    echo $hidden

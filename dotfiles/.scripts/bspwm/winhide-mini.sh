#!/bin/sh

desired_classname="fullscreen"
window_id=$(xdotool search --class "$desired_classname" | head -n 1)
item=$(xdo id -N fullscreen)
hidden=$(bspc query -T -n $item | jq .hidden)
bspc node "$item" -g hidden=on

desired_classname="htop"
window_id=$(xdotool search --class "$desired_classname" | head -n 1)
item=$(xdo id -N htop)
hidden=$(bspc query -T -n $item | jq .hidden)
bspc node "$item" -g hidden=on

desired_classname="cmatrix"
window_id=$(xdotool search --class "$desired_classname" | head -n 1)
item=$(xdo id -N cmatrix)
hidden=$(bspc query -T -n $item | jq .hidden)
bspc node "$item" -g hidden=on

desired_classname="mini"
window_id=$(xdotool search --class "$desired_classname" | head -n 1)

if [ -n "$window_id" ]; then
	sleep 0
else
	alacritty --class mini
fi

item=$(xdo id -N mini)
hidden=$(bspc query -T -n $item | jq .hidden)

if [ "$hidden" = "false" ]; then
    bspc node "$item" -g hidden=on
else
    bspc node "$item" -g hidden=off
    bspc node "$item" -f
fi

    echo $hidden

#!/bin/bash

# Run xrandr query and store the output in a variable
output=$(xrandr --query)


# Check if HDMI-3 is active
if echo "$output" | grep -q "HDMI-3 connected"; then
xrandr --output HDMI-3 --auto
xrandr --output eDP-1 --off
else
xrandr --output HDMI-3 --off
xrandr --output eDP-1 --mode 1920x1200 --rate 59.88
fi

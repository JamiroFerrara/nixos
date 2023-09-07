# Get a list of open Alacritty windows and their titles
open_windows=$(wmctrl -l | grep "Alacritty")

# Check if any of the windows have "htop" in their title
if echo "$open_windows" | grep -q "htop"; then
    echo "Alacritty with htop is already open."
else
    # If not, open a new Alacritty window with htop
    alacritty -e htop
fi

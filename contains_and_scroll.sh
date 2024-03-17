#!/bin/bash

# Open the containing directory in a new Nemo window
if [ -f "$1" ] || [ -d "$1" ]; then
    nemo "$(dirname "$1")" &
    sleep 2 # Wait for the window to open

    # Simulate typing the name to highlight the file or directory
    xdotool type "$(basename "$1")"
    # Simulate pressing the Escape key to close the window
    xdotool key Escape

    # Adjust window position
    sleep 1 # Wait for the window to fully open
    window_id=$(xdotool search --name "Nemo")
    window_geometry=$(xdotool getwindowgeometry --shell $window_id)
    window_width=$(echo "$window_geometry" | grep WIDTH | sed 's/WIDTH=//')
    window_height=$(echo "$window_geometry" | grep HEIGHT | sed 's/HEIGHT=//')
    screen_width=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 1)
    screen_height=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d 'x' -f 2)
    new_x=$((($screen_width - $window_width) / 2))
    new_y=$((($screen_height - $window_height) / 2))
    xdotool windowmove $window_id $new_x $new_y
else
    echo "The argument is not a valid file or directory."
fi

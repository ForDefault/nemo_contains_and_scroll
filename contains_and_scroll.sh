#!/bin/bash

# Open the containing directory in a new Nemo window
if [ -f "$1" ] || [ -d "$1" ]; then
    nemo "$(dirname "$1")" &
    sleep 1 #ADJUST_ME if going to fast Wait for the window to open

    # Simulate typing the name to highlight the file or directory
    xdotool type "$(basename "$1")"
    xdotool key Escape # Simulate pressing the Escape key to close any open dialog

    # Adjust window position after waiting for the window to fully open
 #UNCOMMENT sleep if going too fast
    #sleep 1
    window_id=$(xdotool search --name "Nemo" | head -n 1)
    if [ ! -z "$window_id" ]; then
        window_geometry=$(xdotool getwindowgeometry --shell "$window_id")
        window_width=$(echo "$window_geometry" | grep WIDTH | cut -d '=' -f 2)
        window_height=$(echo "$window_geometry" | grep HEIGHT | cut -d '=' -f 2)
        screen_width=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d 'x' -f 1)
        screen_height=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d 'x' -f 2)
        new_x=$(( (screen_width - window_width) / 2 ))
        new_y=$(( (screen_height - window_height) / 2 ))
        xdotool windowmove "$window_id" "$new_x" "$new_y"
    else
        echo "Nemo window not found."
    fi
else
    echo "The argument is not a valid file or directory."
fi

#!/bin/bash

# Fetch all workspace IDs from Aerospace
SPACE_SIDS=$(/opt/homebrew/bin/aerospace list-workspaces --all)

# Clear existing spaces in SketchyBar (if any)
sketchybar --remove '/space\..*/'

# Add workspaces to SketchyBar
for sid in $SPACE_SIDS; do
  sketchybar --add space space.$sid left \
             --set space.$sid \
                    associated_space=$sid \
                    icon=$sid \
                    label.font="sketchybar-app-font:Regular:16.0" \
                    label.padding_right=20 \
                    label.y_offset=0 \
                    script="$PLUGIN_DIR/space.sh" \
             --subscribe space.$sid aerospace_workspace_change
done

# Add a separator (optional)
sketchybar --add item space_separator left \
           --set space_separator icon="" \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=4 \
                                 label.drawing=off \
                                 background.drawing=off
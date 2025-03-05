#!/bin/sh

# Load colors
source "$CONFIG_DIR/colors.sh"

# Fetch the currently focused workspace
FOCUSED_WORKSPACE=$(/opt/homebrew/bin/aerospace list-workspaces --focused)

# Check if the current workspace ($NAME) is the focused workspace
if [ "$NAME" = "space.$FOCUSED_WORKSPACE" ]; then
    # Highlight the active workspace
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=$ACCENT_COLOR \
        label.color=$BAR_COLOR \
        icon.color=$BAR_COLOR
else
    # Normal appearance for inactive workspaces
    sketchybar --set $NAME \
        background.drawing=off \
        label.color=$ACCENT_COLOR \
        icon.color=$ACCENT_COLOR
fi
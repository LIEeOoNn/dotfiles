#!/bin/sh

# Get config directory
CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
source "$CONFIG_DIR/colors.sh"

# Get workspace ID
if [ -n "$1" ]; then
    WORKSPACE_ID="$1"
else
    WORKSPACE_ID="${NAME#space.}"
fi

# Get focused workspace
FOCUSED=$(/opt/homebrew/bin/aerospace list-workspaces --focused)

# Debug output
#echo "$(date) - Script executed for $NAME (ID: $WORKSPACE_ID)" >> /tmp/space_debug.log
#echo "Focused: $FOCUSED" >> /tmp/space_debug.log

# Highlight if focused
if [ "$WORKSPACE_ID" = "$FOCUSED" ]; then
    sketchybar --set $NAME \
        background.drawing=on \
        background.color=$ACCENT_COLOR \
        label.color=$BAR_COLOR
else
    sketchybar --set $NAME \
        background.drawing=off \
        label.color=$WHITE
fi
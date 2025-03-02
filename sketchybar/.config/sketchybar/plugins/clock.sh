#!/bin/sh

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# Format: Day/Month/ Hour:Minute AM/PM
DATETIME=$(date '+%d/%m %H:%M %p')
sketchybar --set "$NAME" label="$DATETIME"


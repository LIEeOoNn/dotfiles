#!/bin/bash

# Get config directory
CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"

# Get workspace states
NON_EMPTY=($(/opt/homebrew/bin/aerospace list-workspaces --monitor focused --empty no))
FOCUSED=$(/opt/homebrew/bin/aerospace list-workspaces --focused)

# Debug output
echo "Non-empty workspaces: ${NON_EMPTY[@]}" >> /tmp/workspace_debug.log
echo "Focused workspace: $FOCUSED" >> /tmp/workspace_debug.log

# Combine workspaces to show (non-empty + focused)
WORKSPACES_TO_SHOW=($(echo "${NON_EMPTY[@]}"$'\n'"$FOCUSED" | sort -un))

# Get existing space items
EXISTING=($(sketchybar --query | jq -r '.[] | select(.name | startswith("space.")) | .name'))

# Add/update workspaces that should be shown
for sid in "${WORKSPACES_TO_SHOW[@]}"; do
    if ! sketchybar --query "space.$sid" &> /dev/null; then
        echo "Adding workspace $sid" >> /tmp/workspace_debug.log
        sketchybar --add item "space.$sid" left \
                  --set "space.$sid" \
                  background.color=0x44ffffff \
                  background.corner_radius=4 \
                  background.height=20 \
                  background.drawing=off \
                  label="$sid" \
                  click_script="/opt/homebrew/bin/aerospace workspace $sid" \
                  script="$CONFIG_DIR/plugins/space.sh $sid" \
                  update_freq=1 \
                  --subscribe "space.$sid" aerospace_workspace_change
    fi
done

# Remove workspaces that shouldn't be shown
for existing in "${EXISTING[@]}"; do
    sid=${existing#space.}
    if [[ ! " ${WORKSPACES_TO_SHOW[@]} " =~ " ${sid} " ]]; then
        echo "Removing workspace $sid" >> /tmp/workspace_debug.log
        sketchybar --remove "$existing"
    fi
done

# Force initial update
sketchybar --trigger workspace_update
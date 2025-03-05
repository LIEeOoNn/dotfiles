#!/bin/bash

# Function to update SketchyBar workspaces
update_sketchybar_workspaces() {
    # Fetch the list of non-empty workspaces
    WORKSPACES=$(/opt/homebrew/bin/aerospace list-workspaces --monitor focused --empty no)

    # Add or update workspaces in SketchyBar
    for sid in $WORKSPACES; do
        if ! sketchybar --query space.$sid &> /dev/null; then
            # Add the workspace if it doesn't exist
            sketchybar --add item space.$sid left \
                --set space.$sid \
                background.color=0x44ffffff \
                background.corner_radius=4 \
                background.height=20 \
                background.drawing=off \
                label="$sid" \
                click_script="/opt/homebrew/bin/aerospace workspace $sid" \
                script="$PLUGIN_DIR/space.sh"
        fi
    done

    # Remove workspaces that no longer exist
    for existing in $(sketchybar --query space.* | grep -o 'space\.[0-9]\+'); do
        sid=${existing#space.}
        if ! echo "$WORKSPACES" | grep -wq "$sid"; then
            # Remove the workspace if it no longer exists
            sketchybar --remove "$existing"
        fi
    done
}

# Watch for workspace changes
while true; do
    # Fetch the current focused workspace
    CURRENT_WORKSPACE=$(/opt/homebrew/bin/aerospace list-workspaces --focused)

    # If the workspace has changed, update SketchyBar
    if [ "$CURRENT_WORKSPACE" != "$LAST_WORKSPACE" ]; then
        update_sketchybar_workspaces
        sketchybar --trigger aerospace_workspace_change 
        LAST_WORKSPACE="$CURRENT_WORKSPACE"
    fi

    # Sleep for a short interval (e.g., 1 second)
    sleep 1
done
#!/bin/bash

bundle_id="$1"
target_workspace="$2"
aerospace="/opt/homebrew/bin/aerospace"

# Open or reveal the application.
/usr/bin/open -b "$bundle_id"

# Wait up to two seconds for its window to become visible to AeroSpace.
for ((attempt = 0; attempt < 20; attempt++)); do
    window_ids="$(
        "$aerospace" list-windows \
            --monitor all \
            --app-bundle-id "$bundle_id" \
            --format '%{window-id}'
    )"

    if [[ -n "$window_ids" ]]; then
        while IFS= read -r window_id; do
            [[ -n "$window_id" ]] || continue

            "$aerospace" move-node-to-workspace \
                --window-id "$window_id" \
                "$target_workspace"
        done <<< "$window_ids"

        break
    fi

    sleep 0.1
done

# Do this last because opening an existing application may change workspaces.
"$aerospace" workspace "$target_workspace"

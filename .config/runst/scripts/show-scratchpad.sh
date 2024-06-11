#!/bin/sh

lockdir=/tmp/runst-scratchpad-show.lock
if mkdir "$lockdir"
then
    window_id=$(xdotool search --name "RuneLite - ")

    if [[ "$output" == '"__i3"' ]]; then
        i3-msg [id=$window_id] scratchpad show
        i3-msg [id=$window_id] focus
    else
        current_workspace_id=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true) | .id')
        find_window_in_workspace_result=$(i3-msg -t get_tree | jq ".. | select(.id? == $current_workspace_id) | .. | select(.window? == $window_id) | .id")
        if [ -z $find_window_in_workspace_result ]; then
            i3-msg [id=$window_id] move container to workspace current
            i3-msg [id=$window_id] focus
        fi
    fi

    sleep 1
    rmdir "$lockdir"
else
  exit 0
fi

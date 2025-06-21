#!/bin/bash

# Test script for SwayNC notifications
# Run this to test your new notification setup

echo "Testing SwayNC notifications..."

# Normal notification
notify-send "Welcome" "Your custom notification system is ready!" \
    --icon=dialog-information \
    --urgency=normal

sleep 2

# Low priority notification  
notify-send "Low Priority" "This is a low priority notification" \
    --icon=dialog-information \
    --urgency=low

sleep 2

# Critical notification
notify-send "Critical Alert" "This is a critical notification!" \
    --icon=dialog-warning \
    --urgency=critical

sleep 2

# Notification with actions
notify-send "Action Test" "This notification has action buttons" \
    --icon=dialog-question \
    --action="accept=Accept" \
    --action="decline=Decline"

sleep 2

# Media notification example
notify-send "Now Playing" "Artist Name - Song Title" \
    --icon=media-playback-start \
    --category=music

sleep 2

# Progress notification
for i in {1..5}; do
    notify-send "Progress Update" "Step $i of 5 completed" \
        --icon=dialog-information \
        --hint=int:value:$((i*20)) \
        --hint=string:synchronous:progress
    sleep 1
done

echo "Notification test complete!"
echo "Press Super+N to toggle the notification center" 
#!/bin/bash

# Updates checker script for waybar
# Shows available package updates

# Check for updates (pacman + AUR)
updates_pacman=$(checkupdates 2>/dev/null | wc -l)
updates_aur=$(yay -Qum 2>/dev/null | wc -l)

total_updates=$((updates_pacman + updates_aur))

if [[ $total_updates -gt 0 ]]; then
    if [[ $total_updates -gt 50 ]]; then
        echo "󰚰 $total_updates"
    elif [[ $total_updates -gt 20 ]]; then
        echo "󰚰 $total_updates"
    else
        echo "󰚰 $total_updates"
    fi
else
    echo ""
fi 
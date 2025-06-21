#!/bin/bash

# Media player script for waybar
# Shows current playing song with beautiful formatting

# Get player status
status=$(playerctl status 2>/dev/null)

if [[ $status == "Playing" ]]; then
    # Get song info
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    
    # Truncate if too long
    if [[ ${#artist} -gt 20 ]]; then
        artist="${artist:0:17}..."
    fi
    if [[ ${#title} -gt 25 ]]; then
        title="${title:0:22}..."
    fi
    
    # Format output
    if [[ -n "$artist" && -n "$title" ]]; then
        echo "󰝚 $artist - $title"
    elif [[ -n "$title" ]]; then
        echo "󰝚 $title"
    else
        echo "󰝚 Playing"
    fi
elif [[ $status == "Paused" ]]; then
    # Get song info for paused
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    
    # Truncate if too long
    if [[ ${#artist} -gt 20 ]]; then
        artist="${artist:0:17}..."
    fi
    if [[ ${#title} -gt 25 ]]; then
        title="${title:0:22}..."
    fi
    
    # Format output
    if [[ -n "$artist" && -n "$title" ]]; then
        echo "󰏤 $artist - $title"
    elif [[ -n "$title" ]]; then
        echo "󰏤 $title"
    else
        echo "󰏤 Paused"
    fi
else
    echo ""
fi 
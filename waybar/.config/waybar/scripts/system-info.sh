#!/bin/bash

# System information script for waybar
# Shows CPU, Memory, and Temperature

# Get CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | awk -F'%' '{print $1}')

# Get memory usage
mem_info=$(free | grep Mem)
mem_total=$(echo $mem_info | awk '{print $2}')
mem_used=$(echo $mem_info | awk '{print $3}')
mem_percentage=$(echo "scale=0; $mem_used * 100 / $mem_total" | bc)

# Get temperature (try multiple sources)
temp=""
if [[ -f /sys/class/thermal/thermal_zone0/temp ]]; then
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    temp=$((temp / 1000))
elif command -v sensors >/dev/null 2>&1; then
    temp=$(sensors | grep -E "Core 0|Package id 0" | head -1 | awk '{print $3}' | sed 's/+//;s/°C.*//')
fi

# Format output
output="󰍛 ${cpu_usage}%"

if [[ -n "$temp" && "$temp" != "" ]]; then
    output="$output  󰏈 ${temp}°C"
fi

output="$output  󰑭 ${mem_percentage}%"

echo "$output" 
#!/bin/bash

set -e
file="/sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness"
current=$(cat "$file")
new="$current"

if [ "$1" = "-inc" ]
then
	new=$(( current + $2 ))
fi

if [ "$1" = "-dec" ]
then
new=$(( current - $2 ))
fi

echo "$new" | tee "$file"

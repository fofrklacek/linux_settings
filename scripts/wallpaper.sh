#!/bin/bash

# check if directory with wallpapers exist
if [ ! -d "$HOME/Pictures/Wallpapers" ]
then
	exit 1
fi

# Check if directory with pictures is not empty
if [ $(ls -A $HOME/Pictures/Wallpapers | wc -l ) -eq 0 ]
then
	exit 1
fi

while true
do
	nitrogen --set-zoom --random ~/Pictures/Wallpapers

	sleep 5m
done

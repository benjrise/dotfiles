#!/bin/bash

if [ "$1" == "on" ]; then
   ~/.config/polybar/launch_focus.sh
elif [ "$1" == "off" ]; then
   ~/.config/polybar/launch.sh
else
  echo "Invalid command. Use 'on' or 'off'."
fi


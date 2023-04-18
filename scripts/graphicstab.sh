#!/bin/bash
#
# stylus 16
# pad 17
if [ "$1" = "on" ]; then
   xsetwacom --set "Wacom Intuos S Pad pad" MapToOutput HDMI-A-0
   xsetwacom --set "Wacom Intuos S Pen stylus" MapToOutput HDMI-A-0
else
   xsetwacom --set "Wacom Intuos S Pad pad" MapToOutput eDP
   xsetwacom --set "Wacom Intuos S Pen stylus" MapToOutput eDP
fi

xsetwacom --set "Wacom Intuos S Pen stylus" Button +3 "key ctrl" "key z"

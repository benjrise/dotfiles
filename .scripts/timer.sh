#!/bin/sh
seconds=$(($(rofi -dmenu -p 'Number of seconds')))
# read -p "Number of seconds: " seconds
if [ $seconds -ge 1 ] ; then

    message="$(rofi -dmenu -p 'Message')"
    # read -p "Message: " message    
    if [ -z "$message" ]; then
        message="⏰ $seconds seconds has expired!"
    fi
    sleep "$seconds" && notify-send "$message"

else
    exit 2
fi

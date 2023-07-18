#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
. /etc/X11/Xsession

if [ -d "$HOME/bin" ] && (! echo $PATH | grep -q "$HOME/bin"); then
    export PATH="$HOME/bin:$PATH"
fi

setxkbmap -option "caps:backspace"
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
# gnome-keyring-daemon --start --components=secrets

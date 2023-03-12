#!/bin/bash
# Remap keys on mini-keyboard 
# ctrl -> super
# left -> crtl

xmodmap -e "keycode 113 = Control_R NoSymbol Control_R"
xmodmap -e "keycode 105 = Super_R NoSymbol Super_R"

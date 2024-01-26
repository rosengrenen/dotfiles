#!/bin/sh

setxkbmap -option
killall xcape

setxkbmap -option 'altwin:swap_lalt_lwin' -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape' -t 0

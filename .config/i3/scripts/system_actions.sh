#!/bin/sh

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -lines 4 <<< "Lock|Suspend|Reboot|Shutdown")"

echo $MENU

[[ $MENU = "Lock" ]]     && $HOME/.config/i3/scripts/lock.sh
[[ $MENU = "Suspend" ]]  && systemctl suspend
[[ $MENU = "Reboot" ]]   && systemctl reboot
[[ $MENU = "Shutdown" ]] && systemctl poweroff

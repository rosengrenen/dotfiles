#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -q main -c ~/.config/polybar/polybar.ini &

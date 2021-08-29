#!/bin/sh
revert() {
	xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 15 15 15
i3lock -n -e -i $HOME/.wallpapers/blue-whale.png
revert

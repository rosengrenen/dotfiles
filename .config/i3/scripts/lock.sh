#!/bin/sh
revert() {
	xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 15 15 15
betterlockscreen -l -- -n -e
revert

#!/usr/bin/env bash

choice=$(echo "English colemak
Swedish colemak
English qwerty
Swedish qwerty" | rofi -dmenu -sorting fzf -matching fuzzy -theme ~/.config/polybar/scripts/rofi/launcher.rasi)

case "$choice" in
  "English colemak")
    setxkbmap -layout us -variant colemak_dh -option altwin:swap_lalt_lwin -option caps:escape
    ;;
  "Swedish colemak")
    setxkbmap -layout colemak_dh_se -option altwin:swap_lalt_lwin -option caps:escape
    ;;
  "English qwerty")
    setxkbmap -layout us -option altwin:swap_lalt_lwin -option caps:escape
    ;;
  "Swedish qwerty")
    setxkbmap -layout se -option altwin:swap_lalt_lwin -option caps:escape
    ;;
  esac

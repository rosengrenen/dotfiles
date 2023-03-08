is_us=$(setxkbmap -query | grep us | wc -l)
is_colemak=$(setxkbmap -query | grep colemak | wc -l)

echo "Is us? $is_us"
echo "Is colemak? $is_colemak"

function set_us_qwerty() {
  echo "Set us qwerty"
  setxkbmap -layout us
}

function set_us_colemak() {
  echo "Set us colemak"
  setxkbmap -layout us -variant colemak_dh
}

function set_se_qwerty() {
  echo "Set se qwerty"
  setxkbmap -layout se
}

function set_se_colemak() {
  echo "Set se colemak"
  setxkbmap -layout colemak_dh_se
}

function toggle_lang() {
  if [ $is_us = 1 ]; then
    if [ $is_colemak = 1 ]; then
      set_se_colemak
    else
      set_se_qwerty
    fi
  else
    if [ $is_colemak = 1 ]; then
      set_us_colemak
    else
      set_us_qwerty
    fi
  fi
}

function toggle_layout() {
  if [ $is_colemak = 1 ]; then
    if [ $is_us = 1 ]; then
      set_us_qwerty
    else
      set_se_qwerty
    fi
  else
    if [ $is_us = 1 ]; then
      set_us_colemak
    else
      set_se_colemak
    fi
  fi
}

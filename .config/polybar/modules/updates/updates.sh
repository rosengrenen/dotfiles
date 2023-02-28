#!/bin/sh

TMP_PACMAN_DB="/tmp/checkup-db-${USER}/"

trap 'rm -f $TMP_PACMAN_DB/db.lck' INT TERM EXIT

PACMAN_DB_PATH="$(pacman-conf DBPath)"
mkdir -p "$TMP_PACMAN_DB"
ln -s "${PACMAN_DB_PATH}/local" "$TMP_PACMAN_DB" &> /dev/null
if ! fakeroot -- pacman -Sy --dbpath "$TMP_PACMAN_DB" --logfile /dev/null &> /dev/null; then
  echo 'Cannot fetch updates'
  exit 1
fi

NUM_UPDATES="$(pacman -Qu --dbpath "$PACMAN_DB_PATH" | wc -l)"
if [ $NUM_UPDATES -eq 0 ]; then
  echo 'Up to date'
else
  echo $NUM_UPDATES
fi
exit 0

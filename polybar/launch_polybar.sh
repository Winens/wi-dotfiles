#!/usr/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar -r wi -c ~/.config/polybar/config.ini &

echo "Polybar Launched!"

#!/usr/bin/bash

killall -q ulauncher

while pgrep -u $UID -x ulauncher >/dev/null; do sleep 1; done

ulauncher --hide-window &

echo "Ulauncher opened."

#!/bin/sh
swayidle -w timeout 300 'swaylock -f -c 000000' \
	timeout 600 'hyprctl dispatch dpms off' \
	resume 'hyprctl dispatch dpms on' \
	timeout 900 'systemctl suspend' \
	before-sleep 'swaylock -f -c 000000' &
# swayidle -w \
# 	timeout 300 ' swaylock ' \
# 	timeout 600 ' hyprctl dispatch dpms off' \
# 	timeout 900 'systemctl suspend' \
# 	resume ' hyprctl dispatch dpms on' \
# 	before-sleep 'swaylock'

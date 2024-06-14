#!/bin/bash

lock_str=" Lock"
shutdown_str="󰐥 Shutdown"
reboot_str=" Reboot"

action=$(printf "$lock_str\n$shutdown_str\n$reboot_str" | rofi -dmenu -i -p "󰐥 Power")

case "$action" in
	$lock_str) hyprlock ;;
	$shutdown_str) shutdown 0;;
	$reboot_str) reboot;;
	*) ;;
esac

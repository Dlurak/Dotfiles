#!/bin/bash

lock_str=" Lock"
shutdown_str="󰐥 Shutdown"
reboot_str=" Reboot"
suspend_str=" Suspend"
hyprland_exit=" Exit Hyprland"

action=$(printf "$lock_str\n$shutdown_str\n$reboot_str\n$suspend_str\n$hyprland_exit" | rofi -dmenu -i -p "󰐥 Power")

case "$action" in
	$lock_str) hyprlock ;;
	$shutdown_str) shutdown 0;;
	$reboot_str) reboot;;
	$suspend_str) systemctl suspend || loginctl suspend;;
	$hyprland_exit) echo hyprctl dispatch exit;;
	*) ;;
esac

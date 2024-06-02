#!/bin/bash

export THEME="light"
echo "light" > ~/.config/THEME

rm ~/Dotfiles/hypr/hyprpaper.conf
cp ~/Dotfiles/hypr/hyprpaper-light.conf ~/Dotfiles/hypr/hyprpaper.conf
killall hyprpaper
hyprpaper& > /dev/null

rm ~/Dotfiles/hypr/colors.conf
cp ~/Dotfiles/hypr/latte.conf ~/Dotfiles/hypr/colors.conf

gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-latte-teal-standard+default"  # for GTK3 apps
gsettings set org.gnome.desktop.interface color-scheme "prefer-light"   # for GTK4 apps

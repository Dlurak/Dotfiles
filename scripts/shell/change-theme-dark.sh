#!/bin/bash

# 3.1 Neovim start always with --listen

export THEME="dark"
echo "dark" > ~/.config/THEME

rm ~/Dotfiles/hypr/hyprpaper.conf
cp ~/Dotfiles/hypr/hyprpaper-dark.conf ~/Dotfiles/hypr/hyprpaper.conf
killall hyprpaper
hyprpaper&

rm ~/Dotfiles/hypr/colors.conf
cp ~/Dotfiles/hypr/mocha.conf ~/Dotfiles/hypr/colors.conf

gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-teal-standard+default"  # for GTK3 apps
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"   # for GTK4 apps

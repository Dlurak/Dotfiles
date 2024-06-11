#!/bin/bash

sessions=$(tmuxinator completions start | tr ' ' '\n')

session_name=$(printf "$sessions" | rofi -dmenu -p " Tmux" -i)

if [ -z "$session_name" ]; then
    exit 1
fi

if ! echo "$sessions" | grep -q "$session_name"; then
	exit 1
fi

tmuxinator start $session_name --no-attach
wezterm start --always-new-process -- tmux a -t $session_name

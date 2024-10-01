#!/bin/bash

session=$(tmux ls -F '#S' | fzf \
	--layout reverse \
	--border rounded \
	--border-label "Tmux Sessions" \
	--no-scrollbar \
	--prompt "✨ " \
	--pointer "👉"
)

if [ -n "$session" ]; then
	tmux switch-client -t "$session"
fi

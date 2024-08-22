#!/bin/bash

project_emoji="🚀"
template_emoji="🛠️"
directory_emoji="📁"

if [ "$1" == "rofi" ]; then
    selection_tool="rofi"
else
    selection_tool="fzf"
fi

theme=$(cat ~/.config/THEME)

fzf_colors="--color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39 \
--color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78 \
--color=marker:#7287fd,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39 \
--color=selected-bg:#bcc0cc"

if [ "$theme" = "dark" ]; then
    fzf_colors="--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a"
fi

list=$(moxide list \
	--format-project "$project_emoji {}"\
	--format-template "$template_emoji {}"\
	--format-directory "$directory_emoji {}"
)

case "$selection_tool" in
	"rofi")
		value=$(echo "$list" | rofi -dmenu -p " Tmux");
		;;
	*)
		value=$(echo "$list" | \
			fzf \
			--no-sort \
			--layout reverse \
			--border rounded \
			--border-label "Moxide Sessions" \
			--no-scrollbar \
			--prompt "✨ " \
			--pointer "👉" \
			$fzf_colors
		)
		;;
esac

emoji="${value:0:1}"
name="${value:2}"

case "$emoji" in
	$project_emoji)
		moxide project start "$name"
		;;
	$template_emoji)
		moxide template start "$name"
		;;
	$directory_emoji)
		moxide dir start "$name"
		;;
esac

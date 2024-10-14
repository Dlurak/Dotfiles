#!/usr/bin/env bash

project_emoji="🚀"
template_emoji="🛠️"
directory_emoji="📁"

list=$(moxide list \
	--format-project "$project_emoji {}"\
	--format-template "$template_emoji {}"\
	--format-directory "$directory_emoji {}"
)

value=$(echo "$list" | \
	fzf \
	--no-sort \
	--layout reverse \
	--border rounded \
	--border-label "Moxide Sessions" \
	--no-scrollbar \
	--prompt "✨ " \
	--pointer "👉"
)

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

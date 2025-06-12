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
	--pointer ">"
)

IFS=' ' read -r emoji name <<< "$value"
case "$emoji" in
	"$project_emoji")
		moxide project start "$name"
		;;
	"$template_emoji")
		echo "$name"
		moxide template start "$name"
		;;
	"$directory_emoji")
		moxide dir start "$name"
		;;
esac

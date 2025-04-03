value=$(find ~/Schule/E-1/Notizen-Typst -mindepth 1 -maxdepth 1 -type d ! -name '.*' -exec basename {} \; | \
	fzf \
		--no-sort \
		--border rounded \
		--border-label "Subject" \
		--no-scrollbar \
		--prompt "🎓️" \
		--pointer ">"
)
moxide temp start typst-school --dir "$HOME/Schule/E-1/Notizen-Typst/${value}" -n "${value}"

current_mode=$(cat ~/.config/THEME | tr -d '\n')

case "$current_mode" in
	"light")
		~/Dotfiles/scripts/shell/change-theme-dark.sh
		;;
	"dark")
		~/Dotfiles/scripts/shell/change-theme-light.sh
		;;
esac

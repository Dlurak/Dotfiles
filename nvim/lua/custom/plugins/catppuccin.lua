local apply_theme = require("custom.utils.vim").apply_theme

return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = apply_theme
}

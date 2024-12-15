local vim_utils = require("custom.utils.vim")

vim.keymap.set(
	{ 'i', 's' },
	'<C-b>',
	function()
		return vim_utils.snippet_jump(1, '<C-b>')
	end,
	{
		expr = true,
		desc = "Snippets | Jump to next input"
	}
)

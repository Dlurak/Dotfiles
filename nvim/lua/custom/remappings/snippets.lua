local vim_utils = require("custom.utils.vim")
local  keymap_set = vim.keymap.set

keymap_set({ 'i', 's' }, '<Tab>', function()
	return vim_utils.snippet_jump(1, '<Tab>')
end, {
	expr = true,
	desc = "Snippets | Jump to next input"
})

keymap_set({ 'i', 's' }, '<S-Tab>', function()
	return vim_utils.snippet_jump(-1, '<S-Tab>')
end, {
	expr = true,
	desc = "Snippets | Jump to previous input"
})

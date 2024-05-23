vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap;
local  keymap_set = vim.keymap.set

keymap("n", "<leader>m", "`", {noremap = true, silent = true })
keymap("n", "<TAB>", "<C-^>", {noremap = true, silent = true, desc = "Alternate bufers" })

keymap_set("n", "<leader>lh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP | Toggle Inlay Hints", silent = true })

keymap_set({ 'i', 's' }, '<Tab>', function()
	if vim.snippet.active({ direction = 1 }) then
		return '<cmd>lua vim.snippet.jump(1)<cr>'
	else
		return '<Tab>'
	end
end, {
	expr = true,
	desc = "Snippets | Jump to next input"
})

require("custom.remappings.splits")
require("custom.remappings.spelling")
require("custom.remappings.vertical")

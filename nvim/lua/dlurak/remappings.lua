vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap;

keymap("n", "<leader>m", "`", {noremap = true, silent = true })
keymap("n", "<TAB>", "<C-^>", {noremap = true, silent = true, desc = "Alternate bufers" })

vim.keymap.set("n", "<leader>lh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "LSP | Toggle Inlay Hints", silent = true })

require("dlurak.remappings.splits")
require("dlurak.remappings.spelling")
require("dlurak.remappings.vertical")

local vim_utils = require("utils.vim")

vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap;
local  keymap_set = vim.keymap.set

keymap("n", "<leader>m", "`", {noremap = true, silent = true })
keymap("n", "<TAB>", "<C-^>", {noremap = true, silent = true, desc = "Alternate bufers" })

keymap_set("t", "<esc><esc>", "<c-\\><c-n>")
keymap_set("n", "ycc", "yygccp", { remap = true })

keymap_set("n", "<leader>lh", vim_utils.toggle_inlay_hints, {
	desc = "LSP | Toggle Inlay Hints", silent = true
})
keymap_set("n", "<leader>ll",  require("custom.lsp.configs").next_diagnostics, {
	desc = "LSP | Toggle Virtual Lines", silent = true
})


require("custom.remappings.splits")
require("custom.remappings.spelling")
require("custom.remappings.vertical")
require("custom.remappings.tabs")

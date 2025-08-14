vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap;
local keymap_set = vim.keymap.set

keymap("n", "<C-u>", "<C-u>zz", {noremap = true, silent = true})
keymap("n", "<C-d>", "<C-d>zz", {noremap = true, silent = true})

keymap("n", "<TAB>", "<C-^>", {noremap = true, silent = true, desc = "Alternate bufers" })

keymap_set("t", "<esc><esc>", "<c-\\><c-n>")
keymap_set("n", "ycc", "yygccp", { remap = true })

keymap_set("n", "<leader>lh", require("utils.vim").toggle_inlay_hints, {
	desc = "LSP | Toggle Inlay Hints", silent = true
})


keymap_set("n", "<leader>lf", function ()
	vim.lsp.buf.format({ async = true })
end, {
	desc = "LSP | Format buffer"
})

require("core.remappings.splits")
require("core.remappings.tabs")

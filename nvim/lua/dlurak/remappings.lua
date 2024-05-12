vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>m", "`", {noremap = true, silent = true})

require("dlurak.remappings.splits")
require("dlurak.remappings.spelling")
require("dlurak.remappings.vertical")

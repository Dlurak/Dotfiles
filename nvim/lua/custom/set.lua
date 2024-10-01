vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
vim.expandtab = true

opt.wrap = false

opt.spelllang = "de,en"

-- have 4 lines padding when scrolling
opt.scrolloff = 4

-- Hightlight the current line number
opt.cursorlineopt = "number"

-- Fold using treesitter
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

vim.opt.fillchars:append({ eob = " " })

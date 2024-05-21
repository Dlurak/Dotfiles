vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
vim.expandtab = true

opt.wrap = false

opt.spelllang = "en"

-- have 4 lines padding when scrolling
opt.scrolloff = 4

-- Disable the ~ for empty lines
vim.wo.fillchars='eob: '

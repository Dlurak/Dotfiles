vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true, silent = true, desc = 'Change focus to window left'})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true, silent = true, desc = 'Change focus to window down'})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true, silent = true, desc = 'Change focus to window up'})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true, silent = true, desc = 'Change focus to window right'})

vim.api.nvim_set_keymap('n', '<M-h>', '<cmd>vertical resize -5<CR>', {noremap = true, silent = true, desc = 'Decrease width of the split'})
vim.api.nvim_set_keymap('n', '<M-j>', '<cmd>resize -5<CR>', {noremap = true, silent = true, desc = 'Decrease height of the split'})
vim.api.nvim_set_keymap('n', '<M-k>', '<cmd>resize +5<CR>', {noremap = true, silent = true, desc = 'Increase height of the split'})
vim.api.nvim_set_keymap('n', '<M-l>', '<cmd>vertical resize +5<CR>', {noremap = true, silent = true, desc = 'Increase width of the split'})

local keymap = require("custom.utils.namespaces").keymap
local namespace = require("custom.utils.namespaces").namespaces.spelling

local km = keymap(namespace)

vim.api.nvim_set_keymap('n', km('f'), 'z=1<CR><CR>', { noremap = true, silent = true, desc = 'Correct the spelling of the word under the cursor' })

vim.api.nvim_set_keymap('n', km('n'), ']s', { noremap = true, silent = true, desc = 'Jump to the next misspelled word' })
vim.api.nvim_set_keymap('n', km('N'), ']s', { noremap = true, silent = true, desc = 'Jump to the next misspelled word' })
vim.api.nvim_set_keymap('n', km('p'), '[s', { noremap = true, silent = true, desc = 'Jump to the previous misspelled word' })

vim.api.nvim_set_keymap('n', km('c'), 'zg', { noremap = true, silent = true, desc = 'Mark a word as correct' })
vim.api.nvim_set_keymap('n', km('i'), 'zw', { noremap = true, silent = true, desc = 'Mark a word as incorrect' })

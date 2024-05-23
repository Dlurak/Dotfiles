function toggle_spell_lang()
	if vim.opt.spelllang:get() == "de" then
		vim.opt.spelllang = "en"
	else
		vim.opt.spelllang = "de"
	end
end

vim.api.nvim_set_keymap('n', '<leader>lf', 'z=1<CR><CR>', { noremap = true, silent = true, desc = 'Correct the spelling of the word under the cursor' })
vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>lua toggle_spell_lang()<CR>', { noremap = true, silent = true, desc = 'Toggle between german and english spell checking' })

vim.api.nvim_set_keymap('n', '<leader>ln', ']s', { noremap = true, silent = true, desc = 'Jump to the next misspelled word' })
vim.api.nvim_set_keymap('n', '<leader>lN', ']s', { noremap = true, silent = true, desc = 'Jump to the next misspelled word' })
vim.api.nvim_set_keymap('n', '<leader>lp', '[s', { noremap = true, silent = true, desc = 'Jump to the previous misspelled word' })

vim.api.nvim_set_keymap('n', '<leader>lc', 'zg', { noremap = true, silent = true, desc = 'Mark a word as correct' })
vim.api.nvim_set_keymap('n', '<leader>li', 'zw', { noremap = true, silent = true, desc = 'Mark a word as incorrect' })

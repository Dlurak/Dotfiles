local autcmd = vim.api.nvim_create_autocmd

-- Markdown
vim.cmd("autocmd FileType markdown setlocal spell")

-- .conf files in ~/.config/hypr/ are hyprlang
vim.cmd([[
  autocmd BufNewFile,BufRead ~/Dotfiles/hypr/*.conf setfiletype hyprlang
]])

-- Set cursorlineopt only for active window
autcmd("WinEnter", {
	callback = function()
		vim.opt.cursorline = true
	end
});

autcmd("WinLeave", {
	callback = function()
		vim.opt.cursorline = false
	end
})

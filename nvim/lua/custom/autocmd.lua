local autcmd = vim.api.nvim_create_autocmd

-- Markdown
vim.cmd("autocmd FileType markdown setlocal spell")

-- .conf files in ~/.config/hypr/ are hyprlang
vim.cmd([[
  autocmd BufNewFile,BufRead ~/Dotfiles/hypr/*.conf setfiletype hyprlang
]])

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(ctx)
		local root = vim.fs.root(ctx.buf, {".git", "Makefile"})

		if root then vim.uv.chdir(root) end
	end,
})

-- Set cursorlineopt only for active buffer
autcmd("BufEnter", {
	callback = function()
		vim.opt.cursorline = true
	end
});

autcmd("BufLeave", {
	callback = function()
		vim.opt.cursorline = false
	end
})

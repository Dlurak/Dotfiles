local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local fn = vim.fn

-- Markdown
vim.cmd("autocmd FileType markdown setlocal spell")

-- Set cursorlineopt only for active window
autocmd("WinEnter", {
	callback = function()
		vim.opt.cursorline = true
	end
});

autocmd("WinLeave", {
	callback = function()
		vim.opt.cursorline = false
	end
})

-- https://www.reddit.com/r/neovim/comments/1i2xw2m/comment/m7jbnnf/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
autocmd("BufWritePre", {
	desc = "Autocreate a dir when saving a file",
	group = augroup("auto_create_dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		fn.mkdir(fn.fnamemodify(file, ":p:h"), "p")
	end,
})

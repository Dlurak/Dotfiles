local apply_theme = require("custom.utils.vim").apply_theme

local autcmd = vim.api.nvim_create_autocmd

-- Markdown
vim.cmd("autocmd FileType markdown setlocal spell")

-- .conf files in ~/.config/hypr/ are hyprlang
vim.cmd([[
  autocmd BufNewFile,BufRead ~/Dotfiles/hypr/*.conf setfiletype hyprlang
]])

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

local timer = vim.loop.new_timer()
timer:start(5000, 5000, vim.schedule_wrap(apply_theme))

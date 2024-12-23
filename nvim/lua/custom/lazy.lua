local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("custom.plugins.cyberdream"),
	require("custom.plugins.telescope"),
	require("custom.plugins.undotree"),
	require("custom.plugins.treesitter"),
	require("custom.plugins.harpoon"),
	require("custom.plugins.neoformat"),
	require("custom.plugins.trouble"),
	require("custom.plugins.neotest"),
	require("custom.plugins.indent-blankline"),
	require("custom.plugins.tmux"),
	require("custom.plugins.boole"),

	require("custom.plugins.mini-files"),
	require("custom.plugins.mini-ai"),

	require("custom.plugins.nvim-surround"),
	require("custom.plugins.todo-comments"),

	require("custom.plugins.neodev"),
	require("custom.plugins.gitsigns"),
	require("custom.plugins.decisive"),

	require("custom.plugins.aerial"),

	{ 'wakatime/vim-wakatime', lazy = false },

	{
		"neovim/nvim-lspconfig",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"kdheepak/cmp-latex-symbols",

		"edgedb/edgedb-vim",
		"elkowar/yuck.vim",
		"apple/pkl-neovim",
	},
})

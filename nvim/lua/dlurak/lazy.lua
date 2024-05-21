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
	require("dlurak.plugins.tokyonight"),
	require("dlurak.plugins.telescope"),
	require("dlurak.plugins.undotree"),
	require("dlurak.plugins.luasnip"),
	require("dlurak.plugins.nerdy"),
	require("dlurak.plugins.treesitter"),
	require("dlurak.plugins.harpoon"),
	require("dlurak.plugins.neoformat"),
	require("dlurak.plugins.trouble"),
	require("dlurak.plugins.neotest"),
	require("dlurak.plugins.indent-blankline"),
	require("dlurak.plugins.tmux"),

	require("dlurak.plugins.mini-files"),

	require("dlurak.plugins.nvim-surround"),
	require("dlurak.plugins.todo-comments"),

	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"edgedb/edgedb-vim",
		"elkowar/yuck.vim"
	},
})

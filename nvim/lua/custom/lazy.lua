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
	require("custom.plugins.catppuccin"),
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

	require("custom.plugins.luasnip"),

	{
		'kaarmu/typst.vim',
		ft = 'typst',
		lazy=false
	},
	{ 'wakatime/vim-wakatime', lazy = false },

	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						icon_preset = "diamond"
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								wiki = "~/wiki",
							},
							default_workspace = "wiki",
						},
					},
				},
			}
		end,
	},

	{
		"saadparwaiz1/cmp_luasnip",
		"neovim/nvim-lspconfig",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"kdheepak/cmp-latex-symbols",
	},
})

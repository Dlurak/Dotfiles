return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"rust",
				"lua",
				"vim",
				"svelte",
				"javascript",
				"typescript",
				"html",
				"markdown",
				"latex",
				"typst",
			},
			modules = {},
			ignore_install = {},
			auto_install = false,
			sync_install = false,
			highlight = { enable = true },
			textobjects = { enable = false },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					node_decremental = "<BS>",
				},
			},
		})
	end
}

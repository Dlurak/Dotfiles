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
				"latex"
			},
			modules = {},
			ignore_install = {},
			auto_install = false,
			sync_install = false,
			highlight = { enable = true },
			textobjects = { enable = false }
		})
	end
}

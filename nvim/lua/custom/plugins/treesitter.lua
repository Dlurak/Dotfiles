return {
	"nvim-treesitter/nvim-treesitter",
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
				"markdown"
			},
			modules = {},
			ignore_install = {},
			auto_install = false,
			sync_install = false,
			highlight = { enable = true },
		})
	end
}

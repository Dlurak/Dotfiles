return {
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
		end,
		keys = {
			{ '<C-n>', '<CMD>NvimTreeToggle<cr>' }
		}
	}

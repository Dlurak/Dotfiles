return {
		"nvim-neotest/neotest",
		lazy = true,
		keys = {
			{"<leader>tt", function () require("neotest").run.run() end},
			{"<leader>tf", function () require("neotest").run.run(vim.fn.expand("%")) end},
			{"<leader>tw", function () require("neotest").output.open() end},
			{"<leader>ts", function () require("neotest").summary.toggle() end},
		},
		dependencies = {
			"rouge8/neotest-rust",
			"marilari88/neotest-vitest",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
    		"antoinemadec/FixCursorHold.nvim",
    		"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rust"),
					require("neotest-vitest"),
				},
			})
		end
	}

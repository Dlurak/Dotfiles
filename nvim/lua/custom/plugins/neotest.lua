local keymap = require("custom.utils.namespaces").keymap
local namespace = require("custom.utils.namespaces").namespaces.neotest

local km = keymap(namespace)

return {
		"nvim-neotest/neotest",
		lazy = true,
		keys = {
			{km("t"), function () require("neotest").run.run() end},
			{km("f"), function () require("neotest").run.run(vim.fn.expand("%")) end},
			{km("w"), function () require("neotest").output.open() end},
			{km("s"), function () require("neotest").summary.toggle() end},
		},
		dependencies = {
			"marilari88/neotest-vitest",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
    		"antoinemadec/FixCursorHold.nvim",
    		"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest"),
				},
			})
		end
	}

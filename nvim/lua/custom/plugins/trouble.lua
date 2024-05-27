local keymap = require("custom.utils.namespaces").keymap
local namespace = require("custom.utils.namespaces").namespaces.trouble

local km = keymap(namespace)

return {
		'folke/trouble.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{km("e"), "<cmd>TroubleToggle document_diagnostics<cr>"},
			{km("o"), "<cmd>Trouble document_diagnostics<cr>"},
			{km("c"), "<cmd>TroubleClose<cr>"},
		}
	}

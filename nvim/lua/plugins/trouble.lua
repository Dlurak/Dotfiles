local keymap = require("utils.namespaces").keymap
local namespace = require("utils.namespaces").namespaces.trouble

local km = keymap(namespace)

return {
	"folke/trouble.nvim",
	keys = {
		{
			km("e"),
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			km("f"),
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			km("s"),
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
	},
	opts = {},
}

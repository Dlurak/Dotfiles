local cmp = require "cmp"
require("custom.snippets.init").register_cmp_source()

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

cmp.setup {
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<C-z>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item()
	},
	sources = {
		{name = "nvim_lsp"},
		{name = "snp"},
		{name = "path"},
		{name = "buffer", keyword_length = 5}
	},
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end
	},
	formatting = {
		format = function (entry, vim_item)
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			vim_item.kind = kind_icons[vim_item.kind]

			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				snp = "[Snippet]",
				path = "[Path]",
				buffer = "[Buffer]",
			})[entry.source.name]

			return vim_item
		end,
		fields = { 'kind', 'abbr', 'menu' },
		expandable_indicator = true
	},
	window = {
		completion = {
			scrollbar = false,
			border = nil,
			side_padding = 2,
		},
		documentation = {
			scrollbar = false,
			border = nil,
			side_padding = 2,
		}
	}
}

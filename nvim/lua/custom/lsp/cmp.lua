local cmp = require "cmp"
require("snippets.init").register_cmp_source()

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

local source_name = {
	nvim_lsp = "[LSP]",
	snp = "[Snip]",
	path = "[Path]",
	buffer = "[Buf]",
}

local window_style = cmp.config.window.bordered {
	scrollbar = false,
	side_padding = 1,
	border = 'rounded',
	winhighlight = 'Normal:guibg,FloatBorder:CmpBorder,CursorLine:Visual,Search:None',
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
		{name = "nvim_lsp", max_item_count = 10},
		{name = "snp"},
		{name = "path"},
		{name = "buffer", keyword_length = 5, max_item_count = 10},
	},
	formatting = {
		format = function (entry, vim_item)
			vim_item.kind = (kind_icons[vim_item.kind] or vim_item.kind) .. " "
			vim_item.menu = source_name[entry.source.name]

			return vim_item
		end,
		fields = { 'kind', 'abbr', 'menu' },
		expandable_indicator = true
	},
	window = {
		completion = window_style,
		documentation = window_style,
	},
}

local on_attach = require("custom.lsp.utils").on_attach
local merge_tables = require("custom.utils.tables").merge_tables
require("mason").setup()

local servers = {
	mason = {
		custom_config = {
			"svelte",
			"tsserver",
			"jsonls",
			"gopls",
		},
		default_config = {
			"lua_ls",
			"emmet_language_server",
			"tailwindcss",
			"bashls",
			"ruff",
			"marksman",
			"v_analyzer",
			"dockerls",
		}
	},
	others = {
		custom_config = {
			-- This is only to make it easier to read, others.custom_config isn't used anywhere
			"rust_analyzer",
			"hyprls",
			"commit-lsp",
		},
		default_config = {
			"sourcekit",
			"hls"
		}
	}
}

require("mason-lspconfig").setup {
	ensure_installed = merge_tables(servers.mason.default_config, servers.mason.custom_config)
}

for _, value in ipairs(merge_tables(servers.mason.default_config, servers.others.default_config)) do
	require("lspconfig")[value].setup { on_attach = on_attach }
end

require("custom.lsp.collection.svelte")
require("custom.lsp.collection.tsserver")
require("custom.lsp.collection.rust")
require("custom.lsp.collection.json")
require("custom.lsp.collection.hypr")
require("custom.lsp.collection.commit")
require("custom.lsp.collection.go")

require("custom.lsp.cmp")

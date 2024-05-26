local on_attach = require("custom.lsp.utils").on_attach
local merge_tables = require("custom.utils.tables").merge_tables
require("mason").setup()

local servers = {
	mason = {
		custom_config = {
			"svelte",
			"tsserver",
			"rust_analyzer",
			"jsonls",
			"eslint"
		},
		default_config = {
			"lua_ls",
			"emmet_ls",
			"tailwindcss",
			"bashls",
			"ruff",
			"marksman",
		}
	},
	others = {
		custom_config = {
			"rust_analyzer"
		},
		default_config = {
			"sourcekit"
		}
	}
}

require("mason-lspconfig").setup {
	ensure_installed = merge_tables(servers.mason.default_config, servers.mason.custom_config)
}

for _, value in ipairs(merge_tables(servers.mason.default_config, servers.others.default_config)) do
	require("lspconfig")[value].setup {
		on_attach = on_attach
	}
end

require("custom.lsp.collection.svelte")
require("custom.lsp.collection.tsserver")
require("custom.lsp.collection.rust")
require("custom.lsp.collection.json")
require("custom.lsp.collection.eslint")

require("custom.lsp.cmp")

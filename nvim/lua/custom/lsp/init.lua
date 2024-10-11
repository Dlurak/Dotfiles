local on_attach = require("custom.lsp.utils").on_attach

local servers = {
	custom_config = {
		-- This is only to make it easier to read, others.custom_config isn't used anywhere
		"rust_analyzer",
		"hyprls",
		"svelte",
		"ts_ls",
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
		"clangd",
		"sourcekit",
		"hls",
		"nil_ls"
	}
}

for _, value in ipairs(servers.default_config) do
	require("lspconfig")[value].setup { on_attach = on_attach }
end

require("custom.lsp.collection.svelte")
require("custom.lsp.collection.ts_ls")
require("custom.lsp.collection.rust")
require("custom.lsp.collection.json")
require("custom.lsp.collection.hypr")
require("custom.lsp.collection.go")

require("custom.lsp.cmp")

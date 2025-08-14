local on_attach = require("custom.lsp.utils").on_attach

local servers = {
	custom_config = {
		-- This is only to make it easier to read, others.custom_config isn't used anywhere
		"rust_analyzer",
		"svelte",
		"ts_ls",
		"jsonls",
		"gopls",
		"nixd",
	},
	default_config = {
		lua_ls = "lua-language-server",
		emmet_ls = "emmet-ls",
		tailwindcss = "tailwindcss",
		bashls = "bashls",
		marksman = "marksman",
		tinymist = "tinymist",
	}
}

for lsp_server, exec_name in pairs(servers.default_config) do
	if vim.fn.executable(exec_name or lsp_server) == 1 then
		require("lspconfig")[lsp_server].setup { on_attach = on_attach }
	end
end

require("custom.lsp.collection.svelte")
require("custom.lsp.collection.ts_ls")
require("custom.lsp.collection.rust")
require("custom.lsp.collection.json")
require("custom.lsp.collection.go")
require("custom.lsp.collection.nix")

require("custom.lsp.cmp")


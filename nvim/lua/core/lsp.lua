local servers = {
	bashls = "bash-language-server",
	emmet_ls = "emmet-ls",
	gopls = "gopls",
	jsonls = "vscode-json-language-server",
	lua_ls = "lua-language-server",
	nixd = "nixd",
	rust_analyzer  = "rust-analyzer",
	svelte = "svelteserver",
	tinymist = "tinymist",
	ts_ls = "typescript-language-server",
}

for lsp_name, exec_name in pairs(servers) do
	if vim.fn.executable(exec_name or lsp_name) == 1 then
		vim.lsp.enable(lsp_name)
	end
end


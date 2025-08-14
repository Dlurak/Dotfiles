local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { 'json', "jsonc" },
	root_markers = { '.git' },
}

local on_attach = require("custom.lsp.utils").on_attach

require('lspconfig').hyprls.setup({
    on_attach = on_attach,
	cmd = { "hyprls", "--stdio" },
	filetypes = { "hyprlang" }
})

local on_attach = require("custom.lsp.utils").on_attach

require("lspconfig").nixd.setup {
    on_attach = on_attach,
	settings = {
		nixd = {
			formatting = {
				command = { "nixfmt" }
			}
		}
	}
}

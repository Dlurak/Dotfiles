local on_attach = require("custom.lsp.utils").on_attach

require("lspconfig")["gopls"].setup {
    on_attach = on_attach,
	settings = {
		gopls = {
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		}
	}
}

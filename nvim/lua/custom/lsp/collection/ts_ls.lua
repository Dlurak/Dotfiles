local on_attach = require("custom.lsp.utils").on_attach

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup {
	init_options = {
		preferences = {
			includeInlayParameterNameHints = "all",
			includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayEnumMemberValueHints = true,
			importModuleSpecifierPreference = 'non-relative'
		},
	},
	on_attach = on_attach,
}

return {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	root_markers = { 'Cargo.toml' },
	capabilities = { experimental = { serverStatusNotification = true } },
	on_attach = function(_, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, 'LspCargoReload', function()
			local clients = vim.lsp.get_clients { bufnr = bufnr, name = 'rust_analyzer' }
			for _, client in ipairs(clients) do
				vim.notify 'Reloading Cargo Workspace'
				client:request('rust-analyzer/reloadWorkspace', nil, function(err)
					if err then
						error(tostring(err))
					end
					vim.notify 'Cargo workspace reloaded'
				end, 0)
			end
		end, { desc = 'Reload current cargo workspace' })
	end,
	before_init = function(init_params, config)
		-- See https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26
		init_params.initializationOptions = config.settings['rust-analyzer']
	end,
	settings = {
        rust_analyzer = {
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
            autoImportCompletions = true,
            reportMissingImports = true,
            followImportForHints = true,

            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "cargo clippy",
            },
        },
	},
}

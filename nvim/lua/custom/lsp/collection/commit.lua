local command = "commit-lsp"

if vim.fn.executable(command) == 1 then
	vim.api.nvim_create_autocmd(
		"FileType",
		{
			group=vim.api.nvim_create_augroup("CommitLspStart", {}),
			pattern="gitcommit",
			callback=function()
				local client = vim.lsp.start_client {
					cmd = { command, "run" },
				}

				vim.lsp.buf_attach_client(0, client)
			end
		}
	)
end

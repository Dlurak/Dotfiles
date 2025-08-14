vim.api.nvim_create_user_command("ToggleInlay", require("utils.vim").toggle_inlay_hints, {
	desc = "LSP | Toggle inlay hints"
})

vim.api.nvim_create_user_command('Blame', function()
	local filename = vim.fn.expand('%')
	local line = vim.fn.line('.')
	local command = string.format('!git blame %s -L%d,+1', filename, line)
	vim.cmd(command)
end, { nargs = 0, desc = "Git blame the current line" })

-- Copy text to clipboard using codeblock format ```{ft}{content}```
vim.api.nvim_create_user_command('CopyCodeBlock', function(opts)
  local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, true)
  local content = table.concat(lines, '\n')
  local result = string.format('```%s\n%s\n```', vim.bo.filetype, content)
  vim.fn.setreg('+', result)
  vim.notify 'Text copied to clipboard'
end, { range = true })

vim.api.nvim_create_user_command('Ft', require('telescope.builtin').filetypes, {})

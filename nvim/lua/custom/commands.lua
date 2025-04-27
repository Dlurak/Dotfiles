local toggle_inlay_hints = require("custom.utils.vim").toggle_inlay_hints
local scratch            = require("custom.userFuncs.scratch")
local floaterm           = require("custom.userFuncs.floaterm")

local write_quit = {"Wq", "WQ"}

for _, value in ipairs(write_quit) do
	vim.api.nvim_create_user_command(value, 'wq', {})
end

vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('WA', 'wa', {})

vim.api.nvim_create_user_command('Q', 'q', {})

vim.api.nvim_create_user_command("Fold", '%!fold -w 80 -s', {})

vim.api.nvim_create_user_command("Silicon", function (opts)
	local filtetype = vim.bo.filetype

	local line1  = opts.line1
	local line2  = opts.line2

	local head_line = line2
	local tail_line = line2 - line1 + 1

	local file_path = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())

	local cat = "cat " .. file_path .. " | "
	local head = "head -n " .. head_line .. " | "
	local tail = "tail -n " .. tail_line .. " | "
	local silicon = "silicon -l " .. filtetype .. " --line-offset " .. line1 .. " -c"

	vim.cmd("!" .. cat .. head .. tail .. silicon)
end, { range = true })


vim.api.nvim_create_user_command("ToggleInlay", toggle_inlay_hints, {
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


vim.api.nvim_create_user_command(
	'Scratch',
	function()
		scratch.scratch()
	end,
	{ desc = "Open a new scratchpad" }
)

vim.api.nvim_create_user_command(
	'Floaterm',
	floaterm.floaterm,
	{ desc = "Toggle a floating terminal" }
)

vim.api.nvim_create_user_command(
	'Ft',
	function()
		require('telescope.builtin').filetypes()
	end,
	{}
)

local write_quit = {"Wq", "WQ"}
local toggle_inlay_hints = require("custom.utils.vim").toggle_inlay_hints

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

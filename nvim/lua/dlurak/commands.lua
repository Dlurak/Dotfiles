local write_quit = {"Wq", "WQ"}

for _, value in ipairs(write_quit) do
	vim.api.nvim_create_user_command(value, 'wq', {})
end

vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wa', 'wa', {})
vim.api.nvim_create_user_command('WA', 'wa', {})

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
	local silicon = "silicon -l " .. filtetype .. " --line-offset " .. line1 .. " --output ~/Pictures/code.png"

	vim.cmd("!" .. cat .. head .. tail .. silicon)
end, { range = true })

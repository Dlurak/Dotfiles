return {
	'echasnovski/mini.files',
	disabled = true,
	version = false,
	keys = {
		{'<C-n>', function() require('mini.files').open() end},
		{'<C-S-n>', function()
			require('mini.files')
			.open(vim.api.nvim_buf_get_name(0), false)
		end},
	}
}

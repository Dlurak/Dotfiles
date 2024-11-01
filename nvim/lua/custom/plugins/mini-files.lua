return {
	'echasnovski/mini.files',
	disabled = true,
	version = false,
	keys = {
		{'<C-n>', function() require('mini.files').open() end},
	}
}

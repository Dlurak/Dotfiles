return {
	"emmanueltouzery/decisive.nvim",
	config = function()
		require('decisive').setup{}
	end,
	lazy=true,
	ft = {'csv'},
	keys = {
		{
			'<leader>cca', ":lua require('decisive').align_csv({})<cr>",
			desc = "Align CSV",
			mode = 'n',
			{ silent = true },
		},
		{
			'<leader>ccA',
			":lua require('decisive').align_csv_clear({})<cr>",
			desc = "Align CSV clear",
			mode = 'n',
			{ silent = true },
		},
		{
			'[c',
			":lua require('decisive').align_csv_prev_col()<cr>",
			desc = "Align CSV prev col",
			mode = 'n',
			{ silent = true },
		},
		{
			']c',
			":lua require('decisive').align_csv_next_col()<cr>",
			desc = "Align CSV next col",
			mode = 'n',
			{ silent = true },
		},
	}
}

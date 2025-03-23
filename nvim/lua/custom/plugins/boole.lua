return {
		"nat-418/boole.nvim",
		config = function()
			require("boole").setup({
				mappings = {
					increment = '<C-a>',
					decrement = '<C-x>'
				},
				additions = {
					{
						"Montag",
						"Dienstag",
						"Mittwoch",
						"Donnerstag",
						"Freitag",
						"Samstag",
						"Sonntag",
					}
				},
			})
		end
	}

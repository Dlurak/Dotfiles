return {
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
			-- 	transparent = false,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
				terminal_colors = true,
				theme = {
					saturation = 1,
					colors = {
						bg =  "#0F000A",
						red = "#FF5053",
						purple = "#B2AAFF",
						green = "#00D486"
					},
				},
				extensions = {
					telescope = true,
					mini = true,
				},
			})

			vim.cmd("colorscheme cyberdream")
		end
	}

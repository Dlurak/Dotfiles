return {
		'folke/trouble.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{"<leader>ee", "<cmd>TroubleToggle document_diagnostics<cr>"},
			{"<leader>eo", "<cmd>Trouble document_diagnostics<cr>"},
			{"<leader>ec", "<cmd>TroubleClose<cr>"},
		}
	}

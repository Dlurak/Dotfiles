return {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ '<C-p>', function () require 'telescope.builtin'.git_files() end },
			{ '<leader>ps', function () require 'telescope.builtin'.grep_string({ search = vim.fn.input("Grep > ") }) end },
			{ '<leader>pf', function () require 'telescope.builtin'.find_files() end },
			{ '<leader>pm', function () require 'telescope.builtin'.marks() end },
			{ '<leader>pm', function () require 'telescope.builtin'.keymaps() end },
			{ '<leader>pc', function () require 'telescope.builtin'.git_commits() end },
			{ '<leader>pg', function () require 'telescope.builtin'.git_status() end },
		}
	}

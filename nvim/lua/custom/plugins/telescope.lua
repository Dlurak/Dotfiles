local keymap = require("utils.namespaces").keymap
local namespace = require("utils.namespaces").namespaces.telescope

local km = keymap(namespace)

return {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require("telescope").setup {
				exxtensions = {
					fzf={}
				},
			}
		end,
		keys = {
			{ '<C-p>', function () require 'telescope.builtin'.git_files() end },
			{ km('r'), function () require 'telescope.builtin'.resume() end },
			{ km('s'), function () require 'telescope.builtin'.grep_string({ search = vim.fn.input("Grep > ") }) end },
			{ km('f'), function () require 'telescope.builtin'.find_files() end },
			{ km('m'), function () require 'telescope.builtin'.marks() end },
			{ km('k'), function () require 'telescope.builtin'.keymaps() end },
			{ km('c'), function () require 'telescope.builtin'.git_commits() end },
			{ km('g'), function () require 'telescope.builtin'.git_status() end },
			{ km('l'), function () require 'telescope.builtin'.live_grep({  }) end },
			{ km('a'), function () require "telescope".extensions.aerial.aerial() end },
		}
	}

local keymap = require("utils.namespaces").keymap
local namespace = require("utils.namespaces").namespaces.telescope

local km = keymap(namespace)

local function self(x)
	return x
end

return {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require("telescope").setup {
				exxtensions = {
					fzf = {}
				},
			}
		end,
		keys = {
			{ '<C-p>', self(require 'telescope.builtin'.git_files) },
			{ km('r'), self(require 'telescope.builtin'.resume) },
			{ km('s'), function () require 'telescope.builtin'.grep_string({ search = vim.fn.input("Grep > ") }) end },
			{ km('f'), self(require 'telescope.builtin'.find_files) },
			{ km('m'), self(require 'telescope.builtin'.marks) },
			{ km('k'), self(require 'telescope.builtin'.keymaps) },
			{ km('c'), self(require 'telescope.builtin'.git_commits) },
			{ km('g'), self(require 'telescope.builtin'.git_status) },
			{ km('l'), self(require 'telescope.builtin'.live_grep) },
		}
	}

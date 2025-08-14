-------------
-- mini.ai --
-------------
return {
	'echasnovski/mini.ai',
	version = '*',
	event = 'VeryLazy',
	config = function()
		local gen_spec = require('mini.ai').gen_spec
		local spec_pair = gen_spec.pair

		local function pair(left, right)
			if right == nil then
				right = left
			end

			return spec_pair(left, right, { type = 'balanced' })
		end

		local custom_textobjects = {
			b = pair('(', ')'),
			B = pair('{', '}'),
			r = pair('[', ']'),
			q = pair("'"),
			Q = pair('"'),
			a = pair('`'),

			f = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
			[';'] = gen_spec.treesitter({ a = '@comment.outer', i = '@comment.outer' }),

			g = function()
				return {
					from = { line = 1, col = 1 },
					to = {
						line = vim.fn.line('$'),
						col = math.max(vim.fn.getline('$'):len(), 1)
					}
				}
			end
		}

		require('mini.ai').setup({
			verbose = false,
			custom_textobjects = custom_textobjects,
		})
	end,
}

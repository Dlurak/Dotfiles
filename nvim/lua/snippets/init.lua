local cmp = require "cmp"

local get_buf_snips = require("snippets.utils").get_buf_snips
local expand_under_cursor = require("snippets.utils").expand_under_cursor

local module = {}

------------------------------------------------------------------------------------------------------
--                                            From Reddit                                           --
-- See https://new.reddit.com/r/neovim/comments/1cxfhom/builtin_snippets_so_good_i_removed_luasnip/ --
------------------------------------------------------------------------------------------------------

function module.register_cmp_source()
		local cmp_source = {}

		function cmp_source.new()
			local self = setmetatable({ cache = {} }, { __index = cmp_source })
			return self
		end

		function cmp_source.complete(self, _, callback)
			local bufnr = vim.api.nvim_get_current_buf()

			if not self.cache[bufnr] then
				local completion_items = vim.tbl_map(function(s)
					return {
						word = s.trigger,
						label = s.trigger,
						kind = cmp.lsp.CompletionItemKind.Snippet,
					}
				end, get_buf_snips())

				self.cache[bufnr] = completion_items
				callback(completion_items)
			end

			callback(self.cache[bufnr])
		end

		function cmp_source:execute(completion_item, callback)
			expand_under_cursor()
			callback(completion_item)
		end

		require('cmp').register_source('snp', cmp_source.new())
end

return module

local cmp = require "cmp"

local get_buf_snips = require("dlurak.snippets.utils").get_buf_snips
local expand_under_cursor = require("dlurak.snippets.utils").expand_under_cursor

------------------------------------------------------------------------------------------------------
--                                            From Reddit                                           --
-- See https://new.reddit.com/r/neovim/comments/1cxfhom/builtin_snippets_so_good_i_removed_luasnip/ --
------------------------------------------------------------------------------------------------------

-- for lsp to not give too many warnings
local vim = vim

return {
	register_cmp_source = function ()
		local cmp_source = {}
		cmp_source.new = function()
			local self = setmetatable({ cache = {} }, { __index = cmp_source })
			return self
		end

		cmp_source.complete = function(self, _, callback)
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
}

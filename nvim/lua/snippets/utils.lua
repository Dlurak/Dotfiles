local snippets = require("snippets.collection")
local global_snippets = snippets.global_snippets
local snippets_by_filetype = snippets.snippets_by_filetype

local module = {}

function module.get_buf_snips()
	local ft = vim.bo.filetype
	local snips = vim.list_slice(global_snippets)

	if ft and snippets_by_filetype[ft] then
		vim.list_extend(snips, snippets_by_filetype[ft])
	end

	return snips
end

local function get_snippet()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	local cur_line = vim.api.nvim_buf_get_lines(0, line - 1, line, true)
	local line_pre_cursor = cur_line[1]:sub(1, col)

	for _, s in ipairs(module.get_buf_snips()) do
		if vim.endswith(line_pre_cursor, s.trigger) then
			return s.trigger, s.body, line, col
		end
	end

	return nil
end

function module.expand_under_cursor()
	local trigger, body, line, col = get_snippet()
	if not trigger or not body or not line or not col then
		return false
	end
	-- remove trigger
	vim.api.nvim_buf_set_text(0, line - 1, col - #trigger, line - 1, col, {})
	vim.api.nvim_win_set_cursor(0, { line, col - #trigger })

	vim.snippet.expand(body)
	return true
end

return module

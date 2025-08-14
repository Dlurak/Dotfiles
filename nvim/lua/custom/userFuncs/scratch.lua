local M = {}

--- @param widthPercentage number|nil
--- @param heightPercentage number|nil
local function winPos(widthPercentage, heightPercentage)
	local width = vim.api.nvim_get_option "columns"
	local height = vim.api.nvim_get_option "lines"

	-- Calculate the floating window size
	local win_width = math.ceil(width * (widthPercentage or 0.5)) + 2 -- Adding 2 for the border
	local win_height = math.ceil(height * (heightPercentage or 0.4)) + 2 -- Adding 2 for the border

	-- Calculate window's starting position
	local row = math.ceil((height - win_height) / 2)
	local col = math.ceil((width - win_width) / 2)

	return {
		width = win_width,
		height = win_height,
		row = row,
		col = col,
	}
end

--- Creates a scratch window and fills it with content.
--- @param content string|nil: The content of the buffer.
--- @param widthPercentage number|nil
--- @param heightPercentage number|nil
--- @return integer: The window ID.
function M.scratch(content, widthPercentage, heightPercentage)
	local pos = winPos(widthPercentage, heightPercentage)

	-- Create a buffer and set it as a scratch buffer
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { (content or "") })

	-- Create the floating window with a border and set some options
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = pos.row,
		col = pos.col,
		width = pos.width,
		height = pos.height,
		border = "single", -- You can also use 'double', 'rounded', or 'solid'
	})

	vim.api.nvim_win_set_option(win, "wrap", false)
	vim.api.nvim_win_set_option(win, "cursorline", true)

	return win
end

return M

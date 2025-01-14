local M = {}

--- @param widthPercentage number|nil
--- @param heightPercentage number|nil
local function winPos(widthPercentage,heightPercentage)
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

--- @param widthPercentage number|nil
--- @param heightPercentage number|nil
--- @return integer: The window ID.
function M.pandoc(widthPercentage, heightPercentage)
	local prev_buf = vim.api.nvim_get_current_buf()
	local prev_cursor = vim.api.nvim_win_get_cursor(0)

	local pos = winPos(widthPercentage, heightPercentage)

	-- Create a buffer and set it as a scratch buffer
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
	vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
	vim.api.nvim_buf_set_option(buf, "filetype", "markdown")

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "" })

	vim.api.nvim_create_autocmd("BufWipeout", {
        buffer = buf,
        callback = function()
            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            if #lines == 0 then
				return
			end

			local markdown_content = table.concat(lines, "\n")
			local tmp_markdown = os.tmpname() .. ".md"
            local tmp_latex = os.tmpname() .. ".tex"

            local markdown_file = io.open(tmp_markdown, "w")
            if markdown_file then
                markdown_file:write(markdown_content)
                markdown_file:close()
            else
                vim.api.nvim_err_writeln("Failed to create temporary markdown file.")
                return
            end

            -- Use pandoc to convert markdown to LaTeX
            os.execute("pandoc " .. tmp_markdown .. " -o " .. tmp_latex)

            -- Read the LaTeX file and insert it into the original buffer
            local latex_file = io.open(tmp_latex, "r")
            if latex_file then
                local latex_lines = {}
                for line in latex_file:lines() do
                    table.insert(latex_lines, line)
                end
                latex_file:close()

                vim.api.nvim_buf_set_lines(prev_buf, prev_cursor[1] - 1, prev_cursor[1] - 1, false, latex_lines)
            else
                vim.api.nvim_err_writeln("Failed to read temporary LaTeX file.")
            end

            -- Clean up temporary files
            os.remove(tmp_markdown)
            os.remove(tmp_latex)
        end,
    })

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		row = pos.row,
		col = pos.col,
		width = pos.width,
		height = pos.height,
		border = "rounded",
	})

	vim.api.nvim_win_set_option(win, "wrap", true)
	vim.api.nvim_win_set_option(win, "linebreak", true)
	vim.api.nvim_win_set_option(win, "cursorline", false)

	return win
end

return M

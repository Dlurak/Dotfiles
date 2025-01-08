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

function run_command(command, stdin)
    local formatted_command = string.format("echo %q | %s", stdin, command)
    
    local handle = io.popen(formatted_command)
    local output = handle:read("*a")
    handle:close()
    
    return output
end


local function markdown_to_latex(markdown_text)
    return run_command("pandoc -t latex -f markdown", markdown_text)
end

--- @param widthPercentage number|nil
--- @param heightPercentage number|nil
--- @return integer: The window ID.
function M.pandoc_win(widthPercentage, heightPercentage)
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

            local markdown = table.concat(lines, "\n")
			local latex = markdown_to_latex(markdown)
            local latex_lines = {}
            for line in string.gmatch(latex, "[^\r\n]+") do
                table.insert(latex_lines, line)
            end
            
            vim.api.nvim_buf_set_lines(prev_buf, prev_cursor[1] - 1, prev_cursor[1] - 1, false, latex_lines)
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

    vim.api.nvim_win_set_option(win, "wrap", false)
    vim.api.nvim_win_set_option(win, "cursorline", true)

    return win
end


return M

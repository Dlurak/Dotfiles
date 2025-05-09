local module = {}

local global_leader = "<leader>"

module.namespaces = {
	harpoon = global_leader .. "h",
	neotest = global_leader .. "t",
	trouble = global_leader .. "e",
	telescope = global_leader .. "p",
	spelling = global_leader .. "l",
	tabs = global_leader .. "f"
}

--- Generates a function to create key mappings under a given namespace.
-- @param leader The leader key for the namespace (e.g., "<leader>l" for spelling).
-- @return A function that takes a key sequence and returns the complete key mapping string.
-- @usage
-- ```lua
-- local keymap = require("utils.namespaces").keymap
-- local km = keymap("<leader>l")
-- vim.api.nvim_set_keymap('n', km('f'), '<CMD>:w<CR>', {})
-- ```
function module.keymap(leader)
	--- Combines the namespace leader with a specific key sequence.
	-- @param rest The specific key sequence to be mapped.
	-- @return The complete key mapping string.
	return function (rest)
		return leader .. rest
	end
end

return module

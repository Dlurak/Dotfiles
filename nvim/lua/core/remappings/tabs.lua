local namespace = require("utils.namespaces").namespaces.tabs
local km = require("utils.namespaces").keymap(namespace)

--- @param key string
--- @param command string
--- @param desc string
local function set_keymap(key, command, desc)
	vim.api.nvim_set_keymap('n', km(key), command, {
		noremap = true,
		silent = true,
		desc = desc
	})
end

set_keymap('t', '<CMD>:tabnew<CR>', '(TABS) Open a new tab')
set_keymap('w', '<CMD>:tabclose<CR>', '(TABS) Close tab')
set_keymap('n', '<CMD>:tabnext<CR>', '(TABS) Next tab')
set_keymap('p', '<CMD>:tabprevious<CR>', '(TABS) Previous tab')

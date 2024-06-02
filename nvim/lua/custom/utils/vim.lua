local module = {}

function module.toggle_inlay_hints()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function module.snippet_jump(direction, alt)
	if vim.snippet.active({ direction = direction }) then
		return '<cmd>lua vim.snippet.jump(1)<cr>'
	else
		return alt
	end
end

function module.apply_theme()
	local theme_file = io.open('/home/dlurak/.config/THEME', 'r')

	--- @type 'dark' | 'light'
	local theme = "dark"
	if theme_file then
		theme = theme_file:read()
		theme_file:close()
	end

	local flavour = 'mocha'
	if theme == 'light' then
		flavour = 'latte'
	end

	vim.cmd.colorscheme('catppuccin-' .. flavour)
end

return module

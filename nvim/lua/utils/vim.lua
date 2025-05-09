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



return module

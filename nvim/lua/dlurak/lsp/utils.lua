local on_attach = function(_, _)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

local function merge_tables(table1, table2)
	local merged = {}

	for _, val in ipairs(table1) do
		table.insert(merged, val)
	end
	for _, val in ipairs(table2) do
		table.insert(merged, val)
	end

	return merged
end

return {
	on_attach = on_attach,
	merge_tables = merge_tables
}

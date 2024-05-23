local module = {}

function module.merge_tables(table1, table2)
	local merged = {}

	for _, val in ipairs(table1) do
		table.insert(merged, val)
	end
	for _, val in ipairs(table2) do
		table.insert(merged, val)
	end

	return merged
end

return module

local aliases = {
	wq = { "Wq", "WQ" },
	wa = { "Wa", "WA" },
	w = { "W" },
	q = { "Q" },
}

for original, aliases in pairs(aliases) do
	for _, alias in pairs(aliases) do
		vim.api.nvim_create_user_command(alias, original, {})
	end
end

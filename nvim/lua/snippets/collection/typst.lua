local plot = [[
#plot(
  (x) => ${1:calc.pow(x, 2)},
  x: (-${2:5}, $2),
  y: (-${3:5}, $3),
)
]]

local function in_school_note()
	local bufnr = vim.api.nvim_get_current_buf()
	local path = vim.api.nvim_buf_get_name(bufnr)
	return vim.startswith(path, "/home/dlurak/Schule/Q/Notizen/")
end

return {
	{ trigger = "center-body", body = "#align(center)[$1]" },
	{ trigger = "center-code", body = "#align(center, $1)" },
	{ trigger = "text", body = '#text(${1:blue}, ${2:""})' },
	{ trigger = "text", body = '#text(${1:blue}, ${2:""})' },
	{ trigger = "integral", body = 'integral_(${1:a})^(${2:b}) ${3} upright(d)x' },
	{ trigger = "dx", body = 'dif x' },
	{
		trigger = "plot",
		body = plot,
		condition = in_school_note
	},
}

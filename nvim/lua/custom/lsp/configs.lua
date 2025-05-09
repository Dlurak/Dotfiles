local module = {}

local default = {
	virtual_text = {
		severity = {
			max = vim.diagnostic.severity.WARN,
		},
	},
	virtual_lines = {
		severity = {
			min = vim.diagnostic.severity.ERROR,
		},
	},
}

local off = {
	virtual_text = { current_line = true },
	virtual_lines = false
}

local all = {
	virtual_text = false,
	virtual_lines = true,
}

vim.diagnostic.config(default)

local current_active = "default"
function module.next_diagnostics()
	if current_active == "default" then
		current_active = "off"
		vim.diagnostic.config(off)
		vim.notify("Disabled all virtual lines")
	elseif current_active == "off" then
		current_active = "all"
		vim.diagnostic.config(all)
		vim.notify("Enabled all virtual lines")
	elseif current_active == "all" then
		current_active = "default"
		vim.diagnostic.config(default)
		vim.notify("Set virtual lines to default")
	end
end

return module

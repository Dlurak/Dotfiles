local module = {}

---Checks if a string starts with another string
---@param str string
---@param start string
---@return boolean
function module.starts_with(str, start)
	return string.find(str, start, 1, true) == 1
end

return module

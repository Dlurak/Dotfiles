local luasnip = require('luasnip')
local ts_utils = require('nvim-treesitter.ts_utils')

local M = {}

function M.is_math()
  local node = ts_utils.get_node_at_cursor()
  while node do
    local node_type = node:type()
    if node_type == "math_environment" or node_type == "inline_formula" then
      return true
    end
    node = node:parent()
  end
  return false
end

return M

local module = {}

local buf = vim.lsp.buf
local keymap = vim.keymap.set

function module.on_attach(_, _)
    keymap("n", "<leader>rn", buf.rename, {})
    keymap("n", "<leader>ca", buf.code_action, {})

    keymap("n", "gd", buf.definition, {})
    keymap("n", "gi", buf.implementation, {})
    keymap("n", "gr", require("telescope.builtin").lsp_references, {})

    keymap("n", "K", buf.hover, {})
end

return module

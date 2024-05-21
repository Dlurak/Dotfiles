local cmp = require "cmp"
local luasnip = require "luasnip"

cmp.setup {
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-z>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        },
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item()
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "path"},
        {name = "buffer", keyword_length = 5}
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    }
}

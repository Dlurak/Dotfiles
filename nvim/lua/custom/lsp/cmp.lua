local cmp = require "cmp"
require("custom.snippets.init").register_cmp_source()

cmp.setup {
    mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),
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
        {name = "snp"},
        {name = "path"},
        {name = "buffer", keyword_length = 5}
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    }
}

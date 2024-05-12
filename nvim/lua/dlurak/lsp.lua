require("mason").setup()

local cmp = require "cmp"
local luasnip = require "luasnip"

local custom_languages = {
    "svelte"
}

local default_languages = {
    "lua_ls",
    "emmet_ls",
    "tsserver",
    "tailwindcss",
    "rust_analyzer",
    "bashls",
}

local all_langs = {}

for _, lang in ipairs(custom_languages) do
    table.insert(all_langs, lang)
end
for _, lang in ipairs(default_languages) do
    table.insert(all_langs, lang)
end

require("mason-lspconfig").setup {
    ensure_installed = all_langs
}

local on_attach = function(_, _)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

for _, value in ipairs(default_languages) do
    require("lspconfig")[value].setup {
        on_attach = on_attach
    }
end

require "lspconfig".svelte.setup {
    on_attach = function(client)
        vim.api.nvim_create_autocmd(
            "BufWritePost",
            {
                pattern = {"*.js", "*.ts"},
                callback = function(ctx)
                    client.notify("$/onDidChangeTsOrJsFile", {uri = ctx.file})
                end
            }
        )
        on_attach()
    end
}

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

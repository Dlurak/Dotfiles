local on_attach = require("dlurak.lsp.utils").on_attach
local merge_tables = require("dlurak.lsp.utils").merge_tables
require("mason").setup()

local custom_languages = {
    "svelte",
    "tsserver",
}

local default_languages = {
    "lua_ls",
    "emmet_ls",
    "tailwindcss",
    "rust_analyzer",
    "bashls",
}

local all_langs = merge_tables(custom_languages, default_languages)

require("mason-lspconfig").setup {
    ensure_installed = all_langs
}

for _, value in ipairs(default_languages) do
    require("lspconfig")[value].setup {
        on_attach = on_attach
    }
end

require("dlurak.lsp.svelte")
require("dlurak.lsp.tsserver")

require("dlurak.lsp.cmp")

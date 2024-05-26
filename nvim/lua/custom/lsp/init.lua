local on_attach = require("custom.lsp.utils").on_attach
local merge_tables = require("custom.utils.tables").merge_tables
require("mason").setup()

local custom_languages = {
    "svelte",
    "tsserver",
    "rust_analyzer",
	"jsonls",
	"eslint"
}

local default_languages = {
    "lua_ls",
    "emmet_ls",
    "tailwindcss",
    "bashls",
	"ruff",
	"marksman",
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

require("custom.lsp.collection.svelte")
require("custom.lsp.collection.tsserver")
require("custom.lsp.collection.rust")
require("custom.lsp.collection.json")
require("custom.lsp.collection.eslint")

require("custom.lsp.cmp")

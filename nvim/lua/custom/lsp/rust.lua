local on_attach = require("custom.lsp.utils").on_attach

require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach,
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    settings = {
        rust_analyzer = {
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
            autoImportCompletions = true,
            reportMissingImports = true,
            followImportForHints = true,

            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "cargo clippy",
            },
        },
    },
})

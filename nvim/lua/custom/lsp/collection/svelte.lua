local on_attach = require("custom.lsp.utils").on_attach

require("lspconfig")["svelte"].setup {
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

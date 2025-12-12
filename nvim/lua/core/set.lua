local opt = vim.opt

vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
vim.expandtab = true

opt.wrap = false
opt.breakindent = true
opt.linebreak = true

opt.spelllang = "de,en"

-- have 4 lines padding when scrolling
opt.scrolloff = 4
opt.sidescrolloff = 12

-- Hightlight the current line number
opt.cursorlineopt = "number"

opt.fillchars:append({ eob = " " })

-- Fold using treesitter
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.o.foldmethod = "expr"
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it https://www.reddit.com/r/neovim/comments/1jmqd7t/comment/mkdsgkt/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
         local client = vim.lsp.get_client_by_id(args.data.client_id)
         if client:supports_method('textDocument/foldingRange') then
             local win = vim.api.nvim_get_current_win()
             vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end
    end,
 })

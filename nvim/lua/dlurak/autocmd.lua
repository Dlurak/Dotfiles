-- Markdown
vim.cmd("autocmd FileType markdown setlocal spell")

-- .conf files in ~/.config/hypr/ are hyprlang
vim.cmd([[
  autocmd BufNewFile,BufRead ~/.config/hypr/*.conf setfiletype hyprlang
]])

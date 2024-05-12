-- Markdown
vim.cmd("autocmd FileType markdown setlocal spell")

-- .conf files in ~/.config/hypr/ are hyprlang
vim.cmd([[
  autocmd BufNewFile,BufRead ~/Dotfiles/hypr/*.conf setfiletype hyprlang
]])

{ pkgs }:
with pkgs;
[
  cargo-nextest # For neotest
  gcc # For treesitter
  fzf # Telescope
  # Language Servers
  nixd
  rust-analyzer
  nodePackages.typescript-language-server
  nodePackages_latest.svelte-language-server
  vscode-langservers-extracted
  gopls
  emmet-ls
]

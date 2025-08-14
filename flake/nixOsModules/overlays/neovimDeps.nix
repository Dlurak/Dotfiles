{ pkgs }:
with pkgs;
[
  silicon # For :Silicon
  gcc # For treesitter
  fzf # Telescope
  # Formatting
  nixfmt
  # Language Servers
  bash-language-server
  emmet-ls
  gopls
  vscode-langservers-extracted
  lua-language-server
  nixd
  rust-analyzer
  nodePackages_latest.svelte-language-server
  tinymist
  nodePackages.typescript-language-server
]

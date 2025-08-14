{ pkgs }:
with pkgs;
[
  silicon # For :Silicon
  gcc # For treesitter
  fzf # Telescope
  # Formatting
  nixfmt
  # Language Servers
  nixd
  rust-analyzer
  nodePackages.typescript-language-server
  nodePackages_latest.svelte-language-server
  vscode-langservers-extracted
  gopls
  emmet-ls
  tinymist
  tailwindcss-language-server
  bash-language-server
]

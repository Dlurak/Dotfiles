{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.lsp.enable = lib.mkEnableOption "Language servers";
  };

  config = lib.mkIf config.program.lsp.enable {
    environment.systemPackages = with pkgs; [
      nixd
      rust-analyzer
      cargo-nextest # For neotest
      nodePackages.typescript-language-server
      nodePackages_latest.svelte-language-server
      vscode-langservers-extracted
      gopls
      emmet-ls
      tailwindcss-language-server
    ];
  };
}

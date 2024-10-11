{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  name = "Dotfiles dev shell";

  buildInputs = with pkgs; [
    lua-language-server
    nil
  ];
}

{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  name = "Nix flake nix shell";

  buildInputs = with pkgs; [
    nil
  ];
}

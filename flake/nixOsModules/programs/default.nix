{ lib, ... }:
{
  imports = [
    ./cliFun.nix
    ./cliMinimal.nix
    ./cliRandom.nix
    ./desktop
    ./dev.nix
    ./school.nix
    ./hypr.nix
    ./utils.nix
    ./uwu.nix

    ./nuShell.nix
    ./zshShell.nix
  ];
}

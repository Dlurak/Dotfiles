{ inputs, pkgs, ... }:
let
  module = system: attr: attr.nixosModules.${system}.default;
in
{
  imports = [
    ./programs
    (module "x86_64-linux" inputs.manada)
    inputs.bright.nixosModules.default
    ./airplay.nix
    ./bootloader.nix
    ./firewall.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./variables.nix
    ./network.nix
    ./xdg.nix
    ./powerOff.nix
  ];
}

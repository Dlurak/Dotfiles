{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  options = {
    program.funCli.enable = lib.mkEnableOption "Enable useless but fun cli programs";
  };

  config = lib.mkIf config.program.funCli.enable {
    environment.systemPackages = with pkgs; [
      asciiquarium
      cbonsai
      clolcat
      cmatrix
      cowsay
      fastfetch
      figlet
      fortune
      inputs.jiman.packages.${pkgs.stdenv.hostPlatform.system}.jiman
      inputs.retch.defaultPackage.${pkgs.stdenv.hostPlatform.system}
      krabby
      lolcat
      neofetch
      nitch
      peaclock
      pipes-rs
      sl
      toilet
    ];
  };
}

{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  options = {
    program.funCli.enable = lib.mkEnableOption "Enable useless but fun cli programs";
  };

  config = lib.mkIf config.program.funCli.enable {
    environment.systemPackages = with pkgs; [
      asciiquarium
      cbonsai
      clolcat
      lolcat
      cmatrix
      cowsay
      fastfetch
      inputs.retch.defaultPackage.${pkgs.system}
      inputs.jiman.packages.${pkgs.system}.jiman
      figlet
      neofetch
      nitch
      pipes-rs
      sl
      toilet
      fortune
      peaclock
	  (import ../derivations/tracker.nix {inherit pkgs;})
    ];
  };
}

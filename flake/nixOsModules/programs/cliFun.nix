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
      figlet
      neofetch
      nitch
      pipes-rs
      sl
      toilet
      (fortune.override {withOffensive = true;})
      peaclock
    ];
  };
}

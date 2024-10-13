{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.funCli.enable = lib.mkEnableOption "Enable useless but fun cli programs";
  };

  config = lib.mkIf config.program.funCli.enable {
    environment.systemPackages = with pkgs; [
      asciiquarium
      cava
      cbonsai
      clolcat
      cmatrix
	  cowsay
      fastfetch
      figlet
      neofetch
      nitch
      pipes-rs
      toilet
    ];
  };
}

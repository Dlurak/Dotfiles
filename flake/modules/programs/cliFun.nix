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
      neofetch
      fastfetch
      asciiquarium
	  clolcat
      cbonsai
      pipes-rs
      cmatrix
	  element
	  figlet
	  toilet
    ];
  };
}

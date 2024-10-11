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
      asciiquarium
      cbonsai
      pipes-rs
      cmatrix
	  element
	  toilet
    ];
  };
}

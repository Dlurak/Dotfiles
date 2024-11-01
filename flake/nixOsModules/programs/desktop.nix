{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.desktop.enable = lib.mkEnableOption "Enable desktop programs";
  };

  config = lib.mkIf config.program.desktop.enable {
    environment.systemPackages = with pkgs; [
      discord
	  eog
	  shotwell
      element-desktop
      firefox
      galculator
      kitty
      networkmanagerapplet
      signal-desktop
      spotify
    ];
  };
}

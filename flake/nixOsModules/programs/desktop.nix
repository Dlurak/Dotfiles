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
	  inkscape
	  shotwell
      element-desktop
      firefox
	  chromium
      galculator
      kitty
      networkmanagerapplet
      signal-desktop
      spotify
	  pika-backup
    ];
  };
}

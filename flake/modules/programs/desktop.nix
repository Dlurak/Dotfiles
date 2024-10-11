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
      kitty
      firefox
      networkmanagerapplet
      discord
      signal-desktop
      element-desktop
	  spotify
    ];
  };
}

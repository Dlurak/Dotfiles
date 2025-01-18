{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.desktop.browsers.enable = lib.mkEnableOption "Enable browsers";
  };

  config = lib.mkIf config.program.desktop.browsers.enable {
    environment.systemPackages = with pkgs; [
      firefox
	  chromium
    ];
  };
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.desktop.terms.enable = lib.mkEnableOption "Enable terminal emulators";
  };

  config = lib.mkIf config.program.desktop.terms.enable {
    environment.systemPackages = with pkgs; [
      kitty
	  ghostty
    ];
  };
}

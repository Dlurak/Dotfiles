{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.river.enable = lib.mkEnableOption "Enable river and wayland";
  };

  config = lib.mkIf config.program.river.enable {
    environment.systemPackages = with pkgs; [
      river

      glib
      wl-clipboard
      grim
      slurp
      rofi-wayland
      swaylock
      hyprpaper
    ];
	# For some reason hyprland is needed or else kitty won't start on river
    programs.hyprland.enable = true;
    services.gvfs.enable = true;
  };
}

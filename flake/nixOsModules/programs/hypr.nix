{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.hypr.enable = lib.mkEnableOption "Enable hyprland and wayland";
  };

  config = lib.mkIf config.program.hypr.enable {
    environment.systemPackages = with pkgs; [
      glib
      wl-clipboard
      grim
      slurp
      ags
      rofi
      hyprlock
      hyprpicker
      hyprpaper
      hypridle
    ];
    programs.hyprland.enable = true;
    services.gvfs.enable = true;
  };
}

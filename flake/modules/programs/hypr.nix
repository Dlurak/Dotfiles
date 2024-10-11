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
      wl-clipboard
      grim
      slurp
      ags
      rofi
      hyprlock
      hyprpaper
      hypridle
      google-cursor
    ];
    programs.hyprland.enable = true;
  };
}

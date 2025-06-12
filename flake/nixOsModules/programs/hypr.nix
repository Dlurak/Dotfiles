{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.hypr.enable = lib.mkEnableOption "Enable hyprland and wayland";
  };

  config = lib.mkIf config.program.hypr.enable {
    environment.systemPackages = with pkgs; [
      wshowkeys
      glib
      wl-clipboard
      rofi-wayland
      hyprlock
      hyprpicker
      hyprpaper
      hyprsunset
      wlinhibit
    ];
    programs.hyprland.enable = true;
    services.gvfs.enable = true;

    security.wrappers.wshowkeys = {
      owner = "root";
      group = "root";
      setuid = true;
      source = "${pkgs.wshowkeys}/bin/wshowkeys";
    };
  };
}

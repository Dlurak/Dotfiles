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
      # rofi-wayland
      rofi
      hyprlock
      hyprpicker
      hyprpaper
      hyprsunset
      wlinhibit
      hyprmon

      (writeShellApplication {
        name = "move-ws";
        runtimeInputs = [
          hyprland
          libnotify
          fzf
          # rofi-wayland
          rofi
        ];
        text = builtins.readFile ../customScripts/move-ws.sh;
      })
      (import ../derivations/screen-mirroring.nix { inherit pkgs; })
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

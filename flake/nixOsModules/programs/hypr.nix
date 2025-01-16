{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: let
  ags = inputs.ags;
in {
  options = {
    program.hypr.enable = lib.mkEnableOption "Enable hyprland and wayland";
  };

  config = lib.mkIf config.program.hypr.enable {
    environment.systemPackages = with pkgs; [
      nwg-drawer
      glib
      wl-clipboard
      grim
      slurp
      rofi-wayland
      hyprlock
      hyprpicker
      hyprpaper
      hypridle
      hyprsunset
      wlinhibit

      ags.packages.${pkgs.system}.ags
      (ags.lib.bundle {
        inherit pkgs;
        extraPackages = with ags.packages.${pkgs.system};
          [
            hyprland
            mpris
            battery
            wireplumber
            network
            bluetooth
            powerprofiles
            notifd
          ]
          ++ (with pkgs; [
            hyprpicker
            hypridle
            hyprsunset
            slurp
            grim
            brightnessctl
            libnotify
            wlinhibit
            wl-clipboard
            libnotify
          ]);
        src = ../../../ags;
        name = "my-shell";
        entry = "app.ts";
        gtk4 = false;
      })
      (pkgs.writeShellScriptBin "rotate" ''
        if [ -z "$1" ]; then
            echo "Usage: rotate-screen {up|left|down|right}"
            exit 1
        fi

        case "$1" in
            up)
                ROT=0
                ;;
            left)
                ROT=1
                ;;
            down)
                ROT=2
                ;;
            right)
                ROT=3
                ;;
            *)
                echo "Invalid direction: $1"
                echo "Valid options are: up, left, down, right"
                exit 1
                ;;
        esac

        MONITOR="eDP-1"
        hyprctl keyword monitor "$MONITOR,preferred,auto,1,transform,$ROT"

        echo "Screen rotated $1 (ROT=$ROT)"
      '')
    ];
    programs.hyprland.enable = true;
    services.gvfs.enable = true;
  };
}

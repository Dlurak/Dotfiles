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
      nwg-drawer
      wshowkeys
      glib
      wl-clipboard
      grim
      slurp
      rofi-wayland
      hyprlock
      hyprpicker
      hyprpaper
      hyprsunset
      wlinhibit

      (import ../derivations/random-wall.nix {inherit pkgs;})

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

    security.wrappers.wshowkeys = {
      owner = "root";
      group = "root";
      setuid = true;
      source = "${pkgs.wshowkeys}/bin/wshowkeys";
    };
  };
}

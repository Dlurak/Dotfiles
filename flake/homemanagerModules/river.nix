{
  pkgs,
  config,
  lib,
  ...
}: let
  colors = import ../colors.nix;
  hex = colors.hex;
in {
  options = {
    homeManagerModules.river.enable = lib.mkEnableOption "Enable river (config)";
  };

  config = lib.mkIf config.homeManagerModules.river.enable {
    wayland.windowManager.river = let
      locked = {
        "None XF86AudioRaiseVolume" = "spawn '${pkgs.pamixer}/bin/pamixer -i 2'";
        "None XF86AudioLowerVolume" = "spawn '${pkgs.pamixer}/bin/pamixer -d 2'";
        "None XF86AudioMute" = "spawn '${pkgs.pamixer}/bin/pamixer --toggle-mute'";

        "None XF86AudioMedia" = "spawn '${pkgs.playerctl}/bin/playerctl play-pause'";
        "None XF86AudioPlay" = "spawn '${pkgs.playerctl}/bin/playerctl play-pause'";
        "None XF86AudioPrev" = "spawn '${pkgs.playerctl}/bin/playerctl previous'";
        "None XF86AudioNext" = "spawn '${pkgs.playerctl}/bin/playerctl next'";
      };
      trim = str: builtins.substring 1 (builtins.stringLength str - 1) str;
    in {
      enable = true;
      settings = {
        keyboard-layout = ''-options "caps:escape" de'';
        set-repeat = "50 300";
        focus-follows-cursor = "always";
        set-cursor-warp = "on-focus-change";
        border-color-focused = "0x${trim hex.teal}";
        border-color-unfocused = "0x${trim hex.base}";
        rule-add = ["-app-id 'galculator' float"];
        default-layout = "rivertile";
        spawn = [
          "${pkgs.hyprpaper}/bin/hyprpaper"
          "${pkgs.waybar}/bin/waybar"
        ];
        map = {
          locked = locked;
          normal =
            {
              "Super Return" = "spawn ${pkgs.kitty}/bin/kitty";
              "Super W" = "spawn ${pkgs.firefox}/bin/firefox";
              "Super N" = "spawn ${pkgs.xfce.thunar}/bin/thunar";
              "Super D" = "spawn '${pkgs.rofi-wayland}/bin/rofi -show drun'";
              "Super Q" = "close";
              "Super+Shift E" = "exit";
              "Super J" = "focus-view next";
              "Super K" = "focus-view previous";
              "Super+Shift J" = "swap next";
              "Super+Shift K" = "swap previous";
              "Super+Shift Return" = "zoom";
              "Super H" = ''send-layout-cmd rivertile "main-ratio -0.02"'';
              "Super L" = ''send-layout-cmd rivertile "main-ratio +0.02"'';
              "Super+Shift H" = ''send-layout-cmd rivertile "main-cound +1"'';
              "Super+Shift L" = ''send-layout-cmd rivertile "main-ratio -1"'';
              "Super+Alt H" = "move left 100";
              "Super+Alt J" = "move down 100";
              "Super+Alt K" = "move up 100";
              "Super+Alt L" = "move right 100";
              "Super+Alt+Control H" = "snap left";
              "Super+Alt+Control J" = "snap down";
              "Super+Alt+Control K" = "snap up";
              "Super+Alt+Control L" = "snap right";
              "Super+Alt+Shift H" = "resize horizontal -100";
              "Super+Alt+Shift J" = "resize vertical 100";
              "Super+Alt+Shift K" = "resize vertical -100";
              "Super+Alt+Shift L" = "resize horizontal 100";
              "Super Space" = "toggle-float";
              "Super F" = "toggle-fullscreen";

              "Super Up" = ''send-layout-cmd rivertile "main-location top"'';
              "Super Right" = ''send-layout-cmd rivertile "main-location right"'';
              "Super Down" = ''send-layout-cmd rivertile "main-location bottom"'';
              "Super Left" = ''send-layout-cmd rivertile "main-location left"'';
            }
            // locked;
        };
        map-pointer.normal = {
          "Super BTN_LEFT" = "move-view";
          "Super BTN_RIGHT" = "resize-view";
          "Super BTN_MIDDLE" = "toggle-float";
        };
      };
      extraConfig = ''
        for i in $(seq 1 9)
        do
            tags=$((1 << ($i - 1)))
            riverctl map normal Super $i set-focused-tags $tags
            riverctl map normal Super+Shift $i set-view-tags $tags
            riverctl map normal Super+Control $i toggle-focused-tags $tags
            riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
        done
        all_tags=$(((1 << 32) - 1))
        riverctl map normal Super 0 set-focused-tags $all_tags
        riverctl map normal Super+Shift 0 set-view-tags $all_tags
        rivertile -view-padding 5 -outer-padding 5 -main-ratio 0.75 &
      '';
    };
  };
}

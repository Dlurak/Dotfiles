{
  pkgs,
  config,
  lib,
  ags,
  ...
}: let
  allColors = import ../../colors.nix;
  colors = allColors.hypr;
  tokyoShell = import ./../../noneNix/ags/nix/build.nix {inherit ags pkgs;};
  tokyoShellPath = "${tokyoShell}/bin/tokyo-shell";
in {
  options = {
    homeManagerModules.hyprland.enable = lib.mkEnableOption "Enable hyprland config";
  };
  config = with config.homeManagerModules;
    lib.mkIf hyprland.enable {
      wayland.windowManager.hyprland = let
        accent = colors.pink;
        inactive = colors.base;
        shadow = colors.crust;
        bind = import ./bind.nix {inherit pkgs ags lib;};
        rules = import ./rules.nix;
        wvkbdCommand = "${pkgs.wvkbd}/bin/wvkbd-mobintl --hidden -H 333 -L 300 --bg 1A1B26 --fg 2D3149 --fg-sp 283457  --press-sp BB9AF7 --press BB9AF7 --fn \"SpaceGrotesk 13\"  --landscape-layers landscape,specialpad -l simple,specialpad";
      in {
        enable = true;
        plugins = [pkgs.hyprlandPlugins.hyprgrass];
        settings = {
          plugin = {
            touch_gestures = {
              sensitivity = 5.0;
              workspace_swipe_fingers = 0;
              workspace_swipe_edge = "lr";
              long_press_delay = 400;
              resize_on_border_long_press = true;
              edge_margin = 75;
              emulate_touchpad_swipe = false;

              hyprgrass-bind = [
                ", edge:r:l, workspace, +1"
                ", edge:l:r, workspace, -1"
                ", edge:d:u, exec, kill -34 $(pgrep wvkbd-mobintl) || ${wvkbdCommand}"

                ", edge:l:u, exec, ${pkgs.pamixer}/bin/pamixer -i 3"
                ", edge:l:d, exec, ${pkgs.pamixer}/bin/pamixer -d 3"

                ", edge:r:u, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
                ", edge:r:d, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"

                ", edge:u:d, exec, pkill nwg-drawer || ${pkgs.nwg-drawer}/bin/nwg-drawer"
                ", swipe:4:d, killactive"
                ", swipe:5:d, togglefloating"

                ", swipe:3:d, movetoworkspace, -1"
                ", swipe:3:u, movetoworkspace, +1"

                ", tap:3, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" ~/Pictures/screenshot.png && cat ~/Pictures/screenshot.png | ${pkgs.wl-clipboard}/bin/wl-copy"
                ", tap:4, fullscreen, 0"
                ", tap:5, fullscreen, 1"

                ", swipe:3:ld, exec, ${pkgs.firefox}/bin/firefox"
              ];

              # longpress can trigger mouse binds:
              hyprgrass-bindm = [
                ", longpress:2, movewindow"
                ", longpress:3, resizewindow"
              ];
            };
          };

          monitor = ["eDP-1,1920x1080,0x0,1"];
          exec-once = [
            tokyoShellPath
            "${pkgs.hyprpaper}/bin/hyprpaper"
            "${pkgs.iio-hyprland}/bin/iio-hyprland"
            wvkbdCommand
          ];
          general = {
            gaps_in = 5;
            gaps_out = 8;
            border_size = 2;
            "col.active_border" = accent;
            "col.inactive_border" = inactive;
            resize_on_border = true;
            allow_tearing = false;
            layout = "dwindle";
          };
          decoration = {
            rounding = 3;
            active_opacity = 1.0;
            inactive_opacity = 1.0;

            shadow = {
              range = 100;
              render_power = 1;
              scale = 0.9;
              color = shadow;
            };
          };
          animations = {
            enabled = false;
            bezier = "shot, 0.2, 1.0, 0.2, 1.0";
            animation = [
              "windows, 1, 4, shot, slide"
              "workspaces, 1, 4, shot"
            ];
          };
          group = {
            "col.border_active" = accent;
            "col.border_inactive" = inactive;
            groupbar = {
              enabled = true;
              "col.active" = accent;
              "col.inactive" = inactive;
              text_color = colors.text;
            };
          };
          dwindle = {
            pseudotile = true;
            preserve_split = true;
            force_split = 2;
          };
          misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = false;
          };
          input = {
            kb_layout = "de";
            kb_options = "caps:escape";
            #kb_variant = "colemark";
            kb_model = "";
            kb_rules = "";
            follow_mouse = 1;
            sensitivity = 0;
            touchpad.natural_scroll = false;
          };
          gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 3;
            workspace_swipe_distance = 100;
          };

          ecosystem = {
            no_donation_nag = true;
          };

          bind = bind.bind;
          binde = bind.binde;
          bindm = bind.bindm;
          bindel = bind.bindel;
          bindl = bind.bindl;

          windowrule = rules.windowrule;
          windowrulev2 = rules.windowrulev2;
        };
      };
    };
}

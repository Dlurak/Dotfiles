{
  pkgs,
  config,
  lib,
  ...
}: let
  allColors = import ../../colors.nix;
  colors = allColors.hypr;
in {
  options = {
    homeManagerModules.hyprland.enable = lib.mkEnableOption "Enable hyprland config";
  };
  config = with config.homeManagerModules;
    lib.mkIf hyprland.enable {
      wayland.windowManager.hyprland = let
        accent = colors.teal;
        inactive = colors.base;
        shadow = colors.crust;
        bind = import ./bind.nix {pkgs = pkgs;};
        rules = import ./rules.nix;
      in {
        enable = true;
        settings = {
          monitor = ["eDP-1,1920x1080,0x0,1"];
          exec-once = [
            "${pkgs.hyprpaper}/bin/hyprpaper"
            "${pkgs.hypridle}/bin/hypridle"
            "${pkgs.ags}/bin/ags"
          ];
          general = {
            gaps_in = 5;
            gaps_out = 20;
            border_size = 2;
            "col.active_border" = accent;
            "col.inactive_border" = inactive;
            resize_on_border = false;
            allow_tearing = false;
            layout = "dwindle";
          };
          decoration = {
            rounding = 5;
            active_opacity = 1.0;
            inactive_opacity = 1.0;

            drop_shadow = true;
            shadow_range = 100;
            shadow_render_power = 1;
            shadow_scale = 0.9;
            "col.shadow" = shadow;
          };
          animations = {
            enabled = true;
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
            kb_variant = "";
            kb_model = "";
            kb_rules = "";
            follow_mouse = 1;
            sensitivity = 0;
            touchpad.natural_scroll = false;
          };
          gestures = {
            workspace_swipe = true;
            workspace_swipe_fingers = 3;
            workspace_swipe_distance = 150;
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

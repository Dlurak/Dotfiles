{
  pkgs,
  config,
  lib,
  ags,
  inputs,
  ...
}:
let
  allColors = import ../../colors.nix;
  colors = allColors.hypr;
in
{
  options = {
    homeManagerModules.hyprland.enable = lib.mkEnableOption "Enable hyprland config";
  };
  config =
    with config.homeManagerModules;
    lib.mkIf hyprland.enable {
      wayland.windowManager.hyprland =
        let
          accent = colors.pink;
          inactive = colors.base;
          shadow = colors.crust;
          bind = import ./bind.nix {
            inherit
              pkgs
              ags
              lib
              inputs
              ;
          };
        in
        {
          enable = true;
          plugins =
            let
              hyprgrass = import ./hyprgrass.nix (
                with pkgs;
                {
                  hyprgrass = hyprlandPlugins.hyprgrass;
                  inherit fetchFromGitHub;
                }
              );
            in
            [ hyprgrass ];
          settings = {
            plugin = {
              touch_gestures = import ./touchGestures.nix { inherit pkgs inputs; };
            };

            monitor = [
              "eDP-1,1920x1080,0x0,1"
              # "HDMI-A-2,1920x1080,1920x0,1,mirror,eDP-1"
            ];
            exec-once = import ./exec-once.nix {inherit pkgs ags;};
            general = {
              gaps_in = 5;
              gaps_out = 8;
              border_size = 2;
              "col.active_border" = accent;
              "col.inactive_border" = inactive;
              resize_on_border = true;
              allow_tearing = false;
              layout = "dwindle";

              snap.enabled = true;
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

            ecosystem.no_donation_nag = true;

            bind = bind.bind;
            binde = bind.binde;
            bindm = bind.bindm;
            bindel = bind.bindel;
            bindl = bind.bindl;

            windowrule = import ./rules.nix;
			
			env = [ "TERM,${pkgs.kitty}/bin/kitty" ];
          }
          // (import ./input.nix { inherit pkgs; });
        };
    };
}

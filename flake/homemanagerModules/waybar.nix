{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    homeManagerModules.waybar.enable = lib.mkEnableOption "Enable waybar (config)";
  };

  config = lib.mkIf config.homeManagerModules.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = {
        bar = {
          layer = "top";
          modules-left = ["river/tags"];
          modules-center = ["custom/playerctl"];
          modules-right = ["pulseaudio" "clock"];

          pulseaudio = {
            tooltip = false;
            scroll-step = 1;
            format = "{icon} {volume}%";
            format-muted = "{icon} {volume}%";
            on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
            format-icons.default = ["" ""];
          };

          "custom/playerctl" = {
            on-click = "${pkgs.playerctl}/bin/playerctl play-pause";
            interval = 2;
            exec = "${pkgs.playerctl}/bin/playerctl metadata title";
            format = "  {}";
          };
        };
      };
      style = ../noneNix/waybar-style.css;
    };
  };
}

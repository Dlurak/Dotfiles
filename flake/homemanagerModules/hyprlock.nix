{
  config,
  lib,
  ...
}: let
  color = transparency: "rgba(243, 244, 238, ${transparency})";
  coralRed = "rgba(255, 80, 83, 1)";
in {
  options = {
    homeManagerModules.hyprlock.enable = lib.mkEnableOption "Enable hyprlock config";
    homeManagerModules.hyprlock.background = lib.mkOption {
      type = lib.types.path;
      description = "The path to the wallpaper";
    };
  };
  config = with config.homeManagerModules;
    lib.mkIf hyprlock.enable {
      programs.hyprlock = {
        enable = true;
        settings = {
          background = [{path = "${hyprlock.background}";}];
          input-field = [
            {
              font_color = coralRed;
              outer_color = "rgba(106, 95, 219, 0.0)";
              inner_color = "rgba(106, 95, 219, 0.0)";
              fail_color = "rgba(106, 95, 219, 1.0)";
              check_color = "rgba(106, 95, 219, 1.0)";

              dots_center = true;
              dots_size = 0.35;
              dots_spacing = 0.15;
              fade_on_empty = false;
              hide_input = false;
              rounding = 0;

              font_family = "Space Grotesk, Bold";
              placeholder_text = "ILLEGAL";

              size = "236, 50";
              position = "413, -193";
              halign = "left";
              valign = "top";
            }
          ];
          label = [
            {
              text = "cmd[update:1000] echo \"<span>$(date '+%A, %d %B')</span>\"";
              color = coralRed;
              font_size = 16;
              font_family = "Space Grotesk, Bold";
              position = "428, -483";
              halign = "left";
              valign = "top";
            }
            {
              text = "cmd[update:1000] echo \"<span>$(date '+%H:%M')</span>\"";
              color = coralRed;
              font_size = 110;
              font_family = "Pilowlava";
              position = "320, -295";
              halign = "left";
              valign = "top";
            }
            {
              text = "cmd[update:60000] echo \"<span>󰁹 $(cat /sys/class/power_supply/BAT0/capacity)%</span>\"";
              color = coralRed;
              font_size = 11;
              font_family = "Space Grotesk, Bold";
              position = "-10, 10";
              halign = "right";
              valign = "bottom";
            }
          ];
        };
      };
    };
}

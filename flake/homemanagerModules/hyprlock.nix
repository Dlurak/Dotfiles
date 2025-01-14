{
  config,
  lib,
  ...
}: let
  color = transparency: "rgba(243, 244, 238, ${transparency})";
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
          auth = {
            fingerprint = {
              enabled = true;
              ready_message = "(Scan fingerprint to unlock)";
              present_message = "Scanning fingerprint";
            };
          };
          input-field = [
            {
              size = "180, 30";
              outline_thickness = 2;
              dots_size = 0.4;
              dots_spacing = 0.15;
              dots_center = true;
              outer_color = color "0.0";
              inner_color = color "0.1";
              font_color = color "0.8";
              fade_on_empty = false;
              placeholder_text = "Enter Password";
              hide_input = false;
              position = "0, 390";
              halign = "center";
              valign = "bottom";
            }
          ];
          label = [
            {
              text = "cmd[update:1000] echo \"<span>$(date '+%A, %d %B')</span>\"";
              color = color "1";
              font_size = 16;
              font_family = "Space Grotesk, Bold";
              position = "0, -100";
              halign = "center";
              valign = "top";
            }
            {
              text = "cmd[update:1000] echo \"<span>$(date '+%H:%M')</span>\"";
              color = color "1";
              font_size = 75;
              font_family = "Space Grotesk, Bold";
              position = "0, -120";
              halign = "center";
              valign = "top";
            }
            {
              text = "cmd[update:60000] echo \"<span>󰁹 $(cat /sys/class/power_supply/BAT0/capacity)%</span>\"";
              color = color "1";
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

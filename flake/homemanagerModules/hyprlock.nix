{
  config,
  lib,
  ...
}: {
  options = {
    homeManagerModules.hyprlock.enable = lib.mkEnableOption "Enable hyprlock config";
    homeManagerModules.hyprlock.background = lib.mkOption {
      default = ../../assets/lockscreen.png;
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
              size = "180, 30";
              outline_thickness = 2;
              dots_size = 0.4;
              dots_spacing = 0.15;
              dots_center = true;
              outer_color = "rgba(243, 244, 238, 0.0)";
              inner_color = "rgba(243, 244, 238, 0.1)";
              font_color = "rgba(243, 244, 238, 0.8)";
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
              color = "rgba(250, 250, 250, 0.8)";
              font_size = 16;
              font_family = "Arimo Nerd Font Propo, Bold";
              position = "0, -100";
              halign = "center";
              valign = "top";
            }
            {
              text = "cmd[update:1000] echo \"<span>$(date '+%H:%M')</span>\"";
              color = "rgba(250, 250, 250, 0.8)";
              font_size = 75;
              font_family = "Arimo Nerd Font Propo, Bold";
              position = "0, -120";
              halign = "center";
              valign = "top";
            }
            {
              text = "cmd[update:60000] echo \"<span>󰁹 $(cat /sys/class/power_supply/BAT0/capacity)%</span>\"";
              color = "rgba(250, 250, 250, 0.8)";
              font_size = 11;
              font_family = "Arimo Nerd Font Propo, Bold";
              position = "-10, 10";
              halign = "right";
              valign = "bottom";
            }
          ];
        };
      };
    };
}

{
  config,
  lib,
  ...
}:
let
  allColors = import ../colors.nix;
  colors = allColors.hypr;
  setRgbaOpacity =
    newOpacity: colorName: (allColors.setRgbaOpacity newOpacity allColors.rgba.${colorName});
in
{
  options = {
    homeManagerModules.hyprlock.enable = lib.mkEnableOption "Enable hyprlock config";
  };
  config =
    with config.homeManagerModules;
    lib.mkIf hyprlock.enable {
      programs.hyprlock = {
        enable = true;

        settings = {
          auth = {
            fingerprint = {
              enabled = true;
              ready_message = "(Scan fingerprint to unlock)";
              present_message = "Scanning fingerprint";
            };
          };
          general = {
            disable_loading_bar = true;
            immediate_render = true;
            hide_cursor = false;
            no_fade_in = true;
          };

          background = [
            {
              monitor = "";
              path = "${../assets/wallpaper/geometry.png}";
              blur_passes = 3;
              blur_size = 12;
              noise = "0.1";
              contrast = "1.3";
              brightness = "0.2";
              vibrancy = "0.5";
              vibrancy_darkness = "0.3";
            }
          ];

          input-field = [
            {
              size = "200, 50";
              valign = "bottom";
              position = "0%, 10%";

              outline_thickness = 1;

              font_color = colors.pink;
              outer_color = setRgbaOpacity 0.5 "crust";
              inner_color = "rgba(200, 200, 200, 0.1)";
              check_color = "rgba(247, 193, 19, 0.5)";
              fail_color = setRgbaOpacity 0.5 "red";

              fade_on_empty = false;
              placeholder_text = "Enter Password";

              dots_spacing = 0.2;
              dots_center = true;
              dots_fade_time = 100;

              shadow_color = "rgba(0, 0, 0, 0.1)";
              shadow_size = 7;
              shadow_passes = 2;
            }
          ];

          label = [
            {
              monitor = "";
              text = ''
                cmd[update:1000] echo "<span font-weight='ultralight'>$(date +'%H %M %S')</span>"
              '';
              font_size = 300;
              font_family = "SF Pro Text Ultralight";

              color = colors.pink;

              position = "0%, 2%";

              valign = "center";
              halign = "center";

              shadow_color = "rgba(0, 0, 0, 0.1)";
              shadow_size = 20;
              shadow_passes = 2;
              shadow_boost = 0.3;
            }
            {
              text = "cmd[update:5000] echo \"<span>󰁹 $(cat /sys/class/power_supply/BAT0/capacity)%</span>\"";
              color = colors.pink;
              font_size = 13;
              font_family = "SF Pro Text";
              position = "-10, 10";
              halign = "right";
              valign = "bottom";
            }
          ];
        };
      };
    };
}

{
  config,
  lib,
  ...
}:
let
  walls = import ./wallpaper.nix;
  path = builtins.head walls;
in
{
  options = {
    homeManagerModules.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper config";
  };
  config =
    with config.homeManagerModules;
    lib.mkIf hyprpaper.enable {
      services.hyprpaper = {
        enable = true;
        settings = {
          splash = false;
          splash_offset = 0;
          preload = [ "${path}" ];
          wallpaper = [ ",${path}" ];
        };
      };
    };
}

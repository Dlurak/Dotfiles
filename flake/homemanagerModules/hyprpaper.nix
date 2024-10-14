{
  config,
  lib,
  ...
}: {
  options = {
    homeManagerModules.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper config";
    homeManagerModules.hyprpaper.path = lib.mkOption {
      default = ../../assets/wallpaper.png;
      type = lib.types.path;
      description = "The path to the wallpaper";
    };
  };
  config = with config.homeManagerModules;
    lib.mkIf hyprpaper.enable {
      services.hyprpaper = {
        enable = true;
        settings = {
          splash = false;
          preload = ["${hyprpaper.path}"];
          wallpaper = [",${hyprpaper.path}"];
        };
      };
    };
}

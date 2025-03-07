{pkgs, ...}: 
  pkgs.writeShellScriptBin "random-wall" ''
    wallpapers=(
      "${../../assets/wallpaper/ryo-vending.png}"
      "${../../assets/wallpaper/geometry.png}"
      "${../../assets/wallpaper/tokyo-night.png}"

      "${../../assets/wallpaper/stripes.png}"
      "${../../assets/wallpaper/stripes.png}"
    )

    WALLPAPER="''${wallpapers[RANDOM % ''${#wallpapers[@]}]}"

    echo hyprpaper preload "''${WALLPAPER}"
    hyprctl hyprpaper preload "''${WALLPAPER}"
    hyprctl hyprpaper wallpaper ",''${WALLPAPER}"
  ''

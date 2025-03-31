{
  pkgs,
  lib,
  walls,
  ...
}: let
  wallPaths = builtins.map (p: "${p}") walls;
in
  pkgs.writeShellScriptBin "random-wall" ''
       wallpapers=(
			${lib.concatLines wallPaths}
       )

       WALLPAPER="''${wallpapers[RANDOM % ''${#wallpapers[@]}]}"

       echo hyprpaper preload "''${WALLPAPER}"
       hyprctl hyprpaper preload "''${WALLPAPER}"
       hyprctl hyprpaper wallpaper ",''${WALLPAPER}"
  ''

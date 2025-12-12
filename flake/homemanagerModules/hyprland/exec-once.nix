{ pkgs, ags }:
let
  tokyoShell = import ./../../noneNix/ags/nix/build.nix { inherit ags pkgs; };
in
[
  "${tokyoShell}/bin/tokyo-shell"
  (import ./wvKbd.nix { inherit pkgs; })
  "${pkgs.hyprpaper}/bin/hyprpaper"
  "${pkgs.iio-hyprland}/bin/iio-hyprland"
  "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
  "${pkgs.nwg-drawer}/bin/nwg-drawer -r -ovl -nocats -s ${pkgs.writeText "drawer.css" (builtins.readFile ../../noneNix/drawer.css)}"
]

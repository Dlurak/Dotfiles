{ pkgs }:
(pkgs.writeShellApplication {
  name = "screen-mirroring";
  runtimeInputs = with pkgs; [
    hyprland
    fzf
    rofi-wayland
  ];
  text = builtins.readFile ../customScripts/screen-mirroring.sh;
})

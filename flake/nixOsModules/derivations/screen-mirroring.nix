{ pkgs }:
(pkgs.writeShellApplication {
  name = "screen-mirroring";
  runtimeInputs = with pkgs; [
    hyprland
    fzf
    # rofi-wayland
    rofi
  ];
  text = builtins.readFile ../customScripts/screen-mirroring.sh;
})

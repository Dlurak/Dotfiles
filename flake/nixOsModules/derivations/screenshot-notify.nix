{ pkgs }:
(pkgs.writeShellApplication {
  name = "screenshot-notify";
  runtimeInputs = with pkgs; [
    libnotify
  ];
  text = builtins.readFile ../customScripts/screenshot-notify.sh;
})

{pkgs}:
pkgs.writeShellApplication {
  name = "screenshot-notify";
  runtimeInputs = with pkgs; [libnotify];
  text = builtins.readFile ../scripts/screenshot-notify.sh;
}

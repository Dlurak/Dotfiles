{
  pkgs,
  inputs,
}:
let
  wvkbdCommand = import ./wvKbd.nix { inherit pkgs; };
  bright = inputs.bright.packages.${pkgs.system}.default;
  screenshotNotify = import ../../noneNix/ags/nix/screenshot-notify.nix { inherit pkgs; };
in
{
  sensitivity = 5.0;
  workspace_swipe_fingers = 0;
  workspace_swipe_edge = "lr";
  long_press_delay = 800;
  resize_on_border_long_press = true;
  edge_margin = 50;
  emulate_touchpad_swipe = false;

  hyprgrass-bind = [
    ", edge:r:l, workspace, e+1"
    ", edge:l:r, workspace, e-1"
    ", edge:d:u, exec, kill -34 $(pgrep wvkbd-mobintl) || ${wvkbdCommand}"

    ", edge:r:u, exec, ${pkgs.pamixer}/bin/pamixer -i 3"
    ", edge:r:d, exec, ${pkgs.pamixer}/bin/pamixer -d 3"

    ", edge:l:u, exec, ${bright}/bin/bright --easing 'x^3' set 4%+"
    ", edge:l:d, exec, ${bright}/bin/bright --easing 'x^3' set 4%-"

    ", edge:u:d, exec, pkill nwg-drawer || ${pkgs.nwg-drawer}/bin/nwg-drawer"

    ", swipe:4:d, killactive"
    ", swipe:5:d, togglefloating"

    ", swipe:3:d, movetoworkspace, -1"
    ", swipe:3:u, movetoworkspace, +1"

    ", tap:3, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" ~/Pictures/screenshot.png && cat ~/Pictures/screenshot.png | ${pkgs.wl-clipboard}/bin/wl-copy && ${screenshotNotify}/bin/screenshot-notify"
    ", tap:4, fullscreen, 0"
    ", tap:5, fullscreen, 1"

    ", swipe:3:ld, exec, ${pkgs.firefox}/bin/firefox"
  ];

  hyprgrass-bindm = [
    ", longpress:2, movewindow"
    ", longpress:3, resizewindow"
  ];
}

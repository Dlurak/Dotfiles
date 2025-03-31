{
  ags,
  pkgs,
}: let
  agsPackages = ags.packages.${pkgs.system};
  agsDependencies = with agsPackages; [
    hyprland
    mpris
    battery
    wireplumber
    network
    bluetooth
    powerprofiles
    notifd
    apps
  ];
  systemDeps = with pkgs; [
    hyprpicker
    hyprsunset
    slurp
    grim
    brightnessctl
    libnotify
    wlinhibit
    wl-clipboard
    libnotify
  ];
in
  agsDependencies ++ systemDeps ++ [(import ./screenshot-notify.nix {inherit pkgs;})]

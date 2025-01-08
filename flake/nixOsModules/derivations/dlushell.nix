{
  inputs,
  pkgs,
  ...
}: let
  ags = inputs.ags;
  system = "x86_64-linux";

  extraPackages = with ags.packages.${system}; [
    hyprland
    mpris
    battery
    wireplumber
    network
    bluetooth
    powerprofiles
    notifd

    pkgs.hyprpicker
    pkgs.hypridle
    pkgs.hyprsunset
    pkgs.slurp
    pkgs.grim
    pkgs.brightnessctl
  ];
in
ags.lib.bundle {
	inherit pkgs;
	inherit extraPackages;
	src = ../../../ags;
	name = "dlushell";
	entry = "app.ts";
	gtk4 = false;
}

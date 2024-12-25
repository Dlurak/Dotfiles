{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.desktop.enable = lib.mkEnableOption "Enable desktop programs";
  };

  config = lib.mkIf config.program.desktop.enable {
    environment.systemPackages = with pkgs; [
      discord
      zulip
      element-desktop
      signal-desktop

      eog
      shotwell
      inkscape
      gimp
      krita

      typora

      firefox
      chromium

      kitty
      networkmanagerapplet

      spotify

      galculator
      pika-backup
      resources
      nautilus
    ];
  };
}

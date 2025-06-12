{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.desktop.utils.enable = lib.mkEnableOption "Enable utils";
  };

  config = lib.mkIf config.program.desktop.utils.enable {
    environment.systemPackages = with pkgs; [
      alpaca
      galculator
      nautilus
      networkmanagerapplet
      pavucontrol
      pika-backup
      resources
      zathura
    ];
  };
}

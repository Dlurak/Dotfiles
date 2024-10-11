{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.utils.enable = lib.mkEnableOption "Enable utility programs";
  };

  config = lib.mkIf config.program.utils.enable {
    environment.systemPackages = with pkgs; [
      brightnessctl
      upower
      pavucontrol
      pamixer
    ];
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
  };
}

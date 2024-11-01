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
      nh
      pamixer
      pavucontrol
      upower
      kanata
    ];
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
    services.kanata = {
      enable = true;

      keyboards.keyb = {
        configFile = ../../noneNix/kanata.kbd;
      };
    };
  };
}

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
	  unzip
	  tokei
      pamixer
      pavucontrol
      upower
      kanata
	  ngrok
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

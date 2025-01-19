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
      ngrok
      wf-recorder

      (writers.writeRustBin "colors" {} (builtins.readFile ../customScripts/colors.rs))
      (writers.writeRustBin "timestamp" {} (builtins.readFile ../customScripts/timestamp.rs))
    ];
    services.kanata = {
      enable = true;

      keyboards.keyb = {
        configFile = ../../noneNix/kanata.kbd;
      };
    };
  };
}

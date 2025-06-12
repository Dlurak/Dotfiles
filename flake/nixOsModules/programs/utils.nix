{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.utils.enable = lib.mkEnableOption "Enable utility programs";
  };

  config = lib.mkIf config.program.utils.enable {
    environment.systemPackages = with pkgs; [
      nh
      unzip
      tokei
      pamixer
      pavucontrol
      upower
      wf-recorder

      confy

      (writers.writeRustBin "colors" { } (builtins.readFile ../customScripts/colors.rs))
      (writers.writeRustBin "timestamp" { } (builtins.readFile ../customScripts/timestamp.rs))
    ];
    services.kanata = {
      enable = true;

      keyboards.keyb = {
        configFile = ../../noneNix/kanata.kbd;
      };
    };
    programs.bright.enable = true;
  };
}

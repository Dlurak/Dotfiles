{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.uwu.enable = lib.mkEnableOption "enabwe uwu pwogwams";
  };

  config = lib.mkIf config.program.uwu.enable {
    environment.systemPackages = with pkgs; [
      uwuify
      uwufetch
    ];
  };
}

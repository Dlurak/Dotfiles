{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.dev.enable = lib.mkEnableOption "Enable minimal cli programs";
  };

  config = lib.mkIf config.program.dev.enable {
    environment.systemPackages = with pkgs; [
      alejandra
      gh
      silicon
    ];
  };
}

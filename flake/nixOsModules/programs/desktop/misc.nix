{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.desktop.misc.enable = lib.mkEnableOption "Enable miscellaneous programs";
  };

  config = lib.mkIf config.program.desktop.misc.enable {
    environment.systemPackages = with pkgs; [
      cavalier
      pdfarranger
      komikku
    ];
  };
}

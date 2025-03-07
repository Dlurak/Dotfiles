{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.desktop.misc.enable = lib.mkEnableOption "Enable miscellaneous programs";
  };

  config = lib.mkIf config.program.desktop.misc.enable {
    environment.systemPackages = with pkgs;
      [josm]
      ++ (
        if pkgs.stdenv.isx86_64
        then [typora]
        else []
      );
  };
}

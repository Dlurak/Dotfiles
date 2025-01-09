{
  pkgs,
  lib,
  config,
  ...
}: let
  path = pkg: pkgs.lib.elemAt (builtins.attrNames (builtins.readDir "${pkg}/share/applications")) 0;
in {
  options = {
    mime.enable = lib.mkEnableOption "Enable the mime options";
    mime.apps = lib.mkOption {
      type = lib.types.attrsOf lib.types.package;
      example = {
        "application/pdf" = pkgs.zathura;
      };
    };
  };

  config = lib.mkIf config.mime.enable {
    xdg.mime = {
      enable = true;
      defaultApplications = lib.mapAttrs (name: value: path value) config.mime.apps;
    };
  };
}

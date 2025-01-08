# Thanks to Plasmaa0 <3
# https://github.com/Plasmaa0/NixOS-config/blob/main/configuration/homes/common/applications/mime.nix
{
  lib,
  config,
  ...
}: let
  inherit (lib) mkOption mkEnableOption types;
  cfg = config.mime;
in {
  # to look for proper names of apps
  # ls $(echo $XDG_DATA_DIRS | tr ":" "\n")/applications 2>/dev/null | grep <name>
  options.mime = {
    enable = mkEnableOption "mimeapps config";
    list = mkOption {
      type = types.listOf (types.submodule {
        options = {
          mimeTypes = mkOption {
            type = types.listOf types.str;
            example = ["text/html" "x-scheme-handler/http" "x-scheme-handler/https"];
            description = "Mime types that will be handled.";
          };
          handler = mkOption {
            type = types.either types.str types.package;
            example = "org.qutebrowser.qutebrowser.desktop";
            description = "Application that will be used. It can be name of desktop entry of package providing it";
          };
        };
      });
      description = "List of mimeapps and their associated mimetypes";
      example = [
        {
          mimeTypes = ["text/html" "x-scheme-handler/http" "x-scheme-handler/https"];
          handler = "org.qutebrowser.qutebrowser.desktop";
        }
        {
          mimeTypes = ["application/pdf"];
          handler = lib.literalExpression "pkgs.zathura";
        }
      ];
    };
  };
  config.xdg = let
    mimeapps = builtins.listToAttrs (lib.lists.concatMap (entry:
      map (mimetype: {
        name = "${mimetype}";
        value = [
          (
            if (builtins.isString entry.handler)
            then entry.handler
            else lib.elemAt (builtins.attrNames (builtins.readDir "${entry.handler}/share/applications")) 0
          )
        ];
      })
      entry.mimeTypes)
    cfg.list);
  in
    lib.mkIf cfg.enable {
      mime = {
        enable = true;
        defaultApplications = mimeapps;
        addedAssociations = mimeapps;
      };
    };
}

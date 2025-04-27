{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    homeManagerModules.git.enable = lib.mkEnableOption "Enable git (config)";
    homeManagerModules.git.userName = lib.mkOption {
      type = lib.types.str;
      default = "Dlurak";
      description = "The git username";
    };
    homeManagerModules.git.email = lib.mkOption {
      type = lib.types.str;
      default = "84224239+Dlurak@users.noreply.github.com";
      description = "The git email address";
    };
  };

  config = lib.mkIf config.homeManagerModules.git.enable {
    programs.git = {
      enable = true;

      userName = config.homeManagerModules.git.userName;
      userEmail = config.homeManagerModules.git.email;

      extraConfig = {
        credential = let
          credential.helper = [
            "" # Clear default helper
            "!${pkgs.gh}/bin/gh auth git-credential"
          ];
        in {
          "https://github.com" = credential;
          "https://gist.github.com" = credential;
        };
      };
    };
  };
}

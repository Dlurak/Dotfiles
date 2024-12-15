{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.school.enable = lib.mkEnableOption "enable school programs";
  };

  config = lib.mkIf config.program.school.enable {
    environment.systemPackages = [
      pkgs.gsettings-desktop-schemas
      (import ../derivations/filius.nix {
        pkgs = pkgs;
      })
    ];
  };
}

{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.school.enable = lib.mkEnableOption "enable school programs";
  };

  config = lib.mkIf config.program.uwu.enable {
    environment.systemPackages = [
      (import ../derivations/filius.nix {
        pkgs = pkgs;
      })
    ];
  };
}

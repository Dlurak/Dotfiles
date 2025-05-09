{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.nu.enable = lib.mkEnableOption "Enable nu shell";
  };

  config = lib.mkIf config.program.nu.enable {
    environment.systemPackages = with pkgs; [
      starship
      zoxide
    ];
    users.defaultUserShell = pkgs.nushell;
  };
}

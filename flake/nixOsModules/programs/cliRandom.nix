{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.cliRandom.enable = lib.mkEnableOption "Enable random but useufll cli programs";
  };

  config = lib.mkIf config.program.cliRandom.enable {
    environment.systemPackages = with pkgs; [
      fzf
      bat
      tokei
      yazi
      duf
      glances
      htop
    ];
  };
}

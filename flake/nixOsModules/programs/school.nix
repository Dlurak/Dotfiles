{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.school.enable = lib.mkEnableOption "enable school programs";
  };

  config = lib.mkIf config.program.school.enable {
    environment.systemPackages = with pkgs; [
      evince
      libreoffice
      pdfarranger
      peaclock # Seeing how long 'til the lesson is over
      rnote
      typst
      xournalpp
      zathura
    ];
  };
}

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
    environment.systemPackages = with pkgs; [
      pandoc
      texlive.combined.scheme-full
	  xournalpp
	  rnote
	  zathura
	  peaclock # Seeing how long 'til the lesson is over
    ];
  };
}

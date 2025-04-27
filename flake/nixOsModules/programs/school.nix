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
      xournalpp
      rnote
      zathura
      evince
	  typst
      peaclock # Seeing how long 'til the lesson is over

      (writeShellApplication {
        name = "subj";
        runtimeInputs = [fzf moxide findutils];
        text = builtins.readFile ../customScripts/subj.sh;
      })
    ];
  };
}

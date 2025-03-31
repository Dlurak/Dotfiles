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
	  peaclock # Seeing how long 'til the lesson is over

	  (writeShellScriptBin "subj" ''
		value=$(find ~/Schule/E-1/Notizen-Typst -mindepth 1 -maxdepth 1 -type d ! -name '.*' -exec basename {} \; | \
			${pkgs.fzf}/bin/fzf \
			--no-sort \
			--border rounded
			--border-label "Subject" \
			--no-scrollbar \
			--prompt "🎓️" \
			--pointer ">"
		)
		moxide temp start typst-school --dir "~/Schule/E-1/Notizen-Typst/''${value}" -n "''${value}"
	  '')
    ];
  };
}

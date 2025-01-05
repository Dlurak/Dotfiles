{pkgs, ...}: let
  moxide = import ./moxide.nix {inherit pkgs;};
in
  pkgs.writeShellScriptBin "mox" ''
    project_emoji="🚀"
    template_emoji="🛠️"
    directory_emoji="📁"

    list=$(${moxide}/bin/moxide list \
    	--format-project "$project_emoji {}"\
    	--format-template "$template_emoji {}"\
    	--format-directory "$directory_emoji {}"
    )

    value=$(echo "$list" | \
    	${pkgs.fzf}/bin/fzf \
    	--no-sort \
    	--layout reverse \
    	--border rounded \
    	--border-label "Moxide Sessions" \
    	--no-scrollbar \
    	--prompt "✨ " \
    	--pointer "👉"
    )

    emoji="$(echo "$value" | cut -c1-4)"
    name="$(echo "$value" | cut -c6-)"

    case "$emoji" in
    	$project_emoji)
    		${moxide}/bin/moxide project start "$name"
    		;;
    	$template_emoji)
    		${moxide}/bin/moxide template start "$name"
    		;;
    	$directory_emoji)
    		${moxide}/bin/moxide dir start "$name"
    		;;
    esac
  ''

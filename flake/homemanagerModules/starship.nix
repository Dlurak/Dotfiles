{
  config,
  lib,
  ...
}:
{
  options = {
    homeManagerModules.starship.enable = lib.mkEnableOption "Enable starship config";
  };
  config = lib.mkIf config.homeManagerModules.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        format = "$username@$hostname $directory$git_metrics $git_branch $nix_shell\n$character ";

        character = {
          success_symbol = "[λ](bold blue)";
          error_symbol = "[λ](bold red)";
          vimcmd_symbol = "[λ](bold yellow)";
          format = " [╰─](bold blue)$symbol";
        };
        username = {
          format = " [╭─$user](bold blue)";
          show_always = true;
        };
        hostname = {
          disabled = false;
          format = "[$hostname](bold dimmed blue)";
          ssh_only = false;
        };
        directory = {
          style = "purple";
          truncate_to_repo = true;
          truncation_length = 0;
          truncation_symbol = "…/";
          read_only = " ";
        };
        git_metrics = {
          added_style = "bold blue";
          format = "[+$added]($added_style)/[-$deleted]($deleted_style)";
        };
        git_branch = {
          symbol = "󰘬 ";
          ignore_branches = [
            "master"
            "main"
          ];
          format = "[$symbol$branch(:$remote_branch)]($style)";
        };
        nix_shell = {
          symbol = "󱄅 ";
          format = "[$symbol](cyan) ";
        };
        nodejs.symbol = " ";
        rust.symbol = " ";
        python.symbol = " ";
      };
    };
  };
}

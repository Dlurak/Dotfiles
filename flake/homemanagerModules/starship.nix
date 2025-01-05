{
  config,
  lib,
  ...
}: {
  options = {
    homeManagerModules.starship.enable = lib.mkEnableOption "Enable starship config";
  };
  config = lib.mkIf config.homeManagerModules.starship.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # palette = "catppuccin_mocha";
        # palettes.catppuccin_mocha = {
        #   rosewater = "#f2d5cf";
        #   flamingo = "#eebebe";
        #   pink = "#f4b8e4";
        #   mauve = "#ca9ee6";
        #   red = "#e78284";
        #   maroon = "#ea999c";
        #   peach = "#ef9f76";
        #   yellow = "#e5c890";
        #   green = "#a6d189";
        #   teal = "#81c8be";
        #   sky = "#99d1db";
        #   sapphire = "#85c1dc";
        #   blue = "#8caaee";
        #   lavender = "#babbf1";
        #   text = "#c6d0f5";
        #   subtext1 = "#b5bfe2";
        #   subtext0 = "#a5adce";
        #   overlay2 = "#949cbb";
        #   overlay1 = "#838ba7";
        #   overlay0 = "#737994";
        #   surface2 = "#626880";
        #   surface1 = "#51576d";
        #   surface0 = "#414559";
        #   base = "#303446";
        #   mantle = "#292c3c";
        #   crust = "#232634";
        # };

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
          ignore_branches = ["master" "main"];
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

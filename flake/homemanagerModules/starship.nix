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
        palette = "catppuccin_mocha";
        palettes.catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };

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

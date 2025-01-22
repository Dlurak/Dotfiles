{pkgs, ...}: let
  colors = import ../../colors.nix;
  hex = colors.hex;
in {
  imports = [../../homemanagerModules/default.nix];

  homeManagerModules.git.enable = true;
  homeManagerModules.gtk.enable = true;
  homeManagerModules.homeManager.enable = true;
  homeManagerModules.tmux.enable = true;
  homeManagerModules.hyprpaper = {
    enable = true;
    path = ../../assets/wallpaper.png;
  };
  homeManagerModules.hyprlock = {
    enable = false;
    background = ../../assets/lockscreen.png;
  };
  homeManagerModules.hyprland.enable = false;
  homeManagerModules.hypridle.enable = false;
  homeManagerModules.moxide = import ./moxide.nix;
  homeManagerModules.rofi.enable = true;
  homeManagerModules.zsh.enable = true;
  homeManagerModules.starship.enable = true;
  homeManagerModules.terminals.enable = true;
  homeManagerModules.zathura.enable = true;

  homeManagerModules.river.enable = true;
  homeManagerModules.waybar.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bat = {
    enable = true;
    config.theme = "catppuccin";
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "699f60fc8ec434574ca7451b444b880430319941";
          sha256 = "sha256-6fWoCH90IGumAMc4buLRWL0N61op+AuMNN9CAR9/OdI=";
        };
        file = "themes/Catppuccin Frappe.tmTheme";
      };
    };
  };

  home.file.".peaclock/config".text = ''
    set seconds on
    style active-bg ${hex.teal}
    style date ${hex.teal}
  '';
}

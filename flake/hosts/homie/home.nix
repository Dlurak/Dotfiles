{pkgs, ...}: {
  homeManagerModules.git.enable = true;
  homeManagerModules.gtk.enable = true;
  homeManagerModules.homeManager.enable = true;
  homeManagerModules.tmux.enable = true;
  homeManagerModules.hyprpaper = {
    enable = true;
    path = ../../assets/wallpaper.png;
  };
  homeManagerModules.hyprlock = {
    enable = true;
    background = ../../assets/lockscreen.png;
  };
  homeManagerModules.hyprland.enable = true;
  homeManagerModules.hypridle.enable = true;
  homeManagerModules.moxide = import ./moxide.nix;
  homeManagerModules.rofi.enable = true;
  homeManagerModules.zsh.enable = true;
  homeManagerModules.starship.enable = true;

  # TODO: Move to a standalone module
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  services.mpris-proxy.enable = true;

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrains Mono";
      size = 13;
    };
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
    themeFile = "Catppuccin-Frappe";
  };

  programs.ghostty = {
    enable = true;
    installBatSyntax = false;
    installVimSyntax = false;
    settings = {
      window-decoration = false;
      confirm-close-surface = false;

      ###########
      ## Fonts ##
      ###########
      font-size = 12.5;
      font-family-bold = "JetBrains Mono ExtraBold";
      font-family-italic = "JetBrains Mono Italic";
      font-family-bold-italic = "JetBrains Mono ExtraBold Italic";

      #############
      ## Theming ##
      #############
      theme = "catppuccin-frappe";
    };
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

  gtk.gtk3.bookmarks = [
    "file:///home/dlurak/SoftwareDevelopment/"
    "file:///home/dlurak/Documents"
    "file:///home/dlurak/Downloads"
    "file:///home/dlurak/Schule/"
    "file:///home/dlurak/38c3/"
  ];
}

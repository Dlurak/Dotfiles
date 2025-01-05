{...}: {
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

  home.file.".config/ghostty/config".text = ''
    window-decoration = false
    confirm-close-surface = false

    ###########
    ## Fonts ##
    ###########

    font-size = 14
    font-family = "JetBrains Mono SemiBold"
    font-family-bold = "JetBrains Mono ExtraBold"
    font-family-italic = "JetBrains Mono Italic"
    font-family-bold-italic = "JetBrains Mono ExtraBold Italic"

    #############
    ## Theming ##
    #############

    theme = catppuccin-frappe
  '';
}

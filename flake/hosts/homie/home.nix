{...}: {
  homeManagerModules.git.enable = true;
  homeManagerModules.gtk.enable = true;
  homeManagerModules.homeManager.enable = true;
  homeManagerModules.tmux.enable = true;
  homeManagerModules.hyprpaper = {
    enable = true;
    # path = ../../assets/wallpaper.png;
    path = ../../assets/38c3-wallpaper.png;
  };
  homeManagerModules.hyprlock = {
    enable = true;
    background = ../../assets/38c3-lockscreen.png;
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
}

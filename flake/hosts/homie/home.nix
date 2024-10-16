{
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
  homeManagerModules.moxide = import ./moxide.nix;
}

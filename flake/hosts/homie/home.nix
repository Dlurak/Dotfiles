{pkgs, ...}: {
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

  # TODO: Move to a standalone module
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    cycle = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = ../../noneNix/rofi-frappe.rasi;
    extraConfig = {
      modi = "run,drun,window";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󰕰  Window";
      sidebar-mode = true;
    };
  };
}

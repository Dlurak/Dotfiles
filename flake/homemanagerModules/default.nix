{inputs, ...}: {
  imports = [
    inputs.moxide.homeManagerModules.moxide
    ./git.nix
    ./gtk.nix
    ./homeManager.nix
    ./hypridle.nix
    ./hyprland
    ./hyprlock.nix
    ./hyprpaper.nix
    ./rofi.nix
    ./starship.nix
    ./terminals.nix
    ./tmux.nix
    ./zathura.nix
    ./zsh.nix
  ];
}

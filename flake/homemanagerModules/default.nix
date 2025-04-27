{inputs, ...}: {
  imports = [
    inputs.moxide.homeManagerModules.moxide
    inputs.manada.homemanagerModules.x86_64-linux.default
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

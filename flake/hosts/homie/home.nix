{ pkgs, ... }:
let
  colors = import ../../colors.nix;
  hex = colors.hex;
in
{
  imports = [ ../../homemanagerModules/default.nix ];

  homeManagerModules.git.enable = true;
  homeManagerModules.gtk.enable = true;
  homeManagerModules.homeManager.enable = true;
  homeManagerModules.tmux.enable = true;
  homeManagerModules.hyprpaper.enable = true;
  homeManagerModules.hyprlock.enable = true;
  homeManagerModules.hyprland.enable = true;
  homeManagerModules.hypridle.enable = true;
  programs.moxide = import ./moxide.nix;
  homeManagerModules.rofi.enable = true;
  homeManagerModules.zsh.enable = true;
  homeManagerModules.nu.enable = false;
  homeManagerModules.starship.enable = true;
  homeManagerModules.terminals.enable = true;
  homeManagerModules.zathura.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  services.mpris-proxy.enable = true;

  programs.bat = {
    enable = true;
    config.theme = "tokyonight";
    themes = {
      tokyonight = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
          sha256 = "sha256-1xZhQR1BhH2eqax0swlNtnPWIEUTxSOab6sQ3Fv9WQA=";
        };
        file = "extras/sublime/tokyonight_night.tmTheme";
      };
    };
  };

  gtk.gtk3.bookmarks =
    let
      files = map (path: "file://${path}");
    in
    files [
      "/home/dlurak/SoftwareDevelopment/"
      "/home/dlurak/Dotfiles"
      "/home/dlurak/Pictures/"
      "/home/dlurak/Downloads"
      "/home/dlurak/Schule/"
      "/home/dlurak/Schule/E-1/Notizen-Typst/"
    ];

  home.file.".peaclock/config".text = ''
    set seconds on
    style active-bg ${hex.pink}
    style date ${hex.pink}
  '';

  xdg.desktopEntries = {
    peaclock = {
      name = "Peaclock";
      genericName = "Clock";
      exec = "${pkgs.kitty}/bin/kitty \"${pkgs.peaclock}/bin/peaclock\"";
      terminal = false;
      categories = [ "Applications" ];
    };
  };

  programs.manada = {
    enable = false;
    config = { };
  };
}

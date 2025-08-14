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
      "/home/dlurak/SoftwareDevelopment SoftwareDevelopment"
      "/home/dlurak/Dotfiles Dotfiles"
      "/home/dlurak/Pictures Pictures"
      "/home/dlurak/Downloads Downloads"
      "/home/dlurak/Schule/Q Q-Phase"
      "/home/dlurak/Schule/Q/Notizen/output Notizen"
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

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "command-raw";
        source = "${pkgs.pokeget-rs}/bin/pokeget random --hide-name";
      };
      modules = [
        "break"
        {
          type = "os";
          key = "OS   ";
          keyColor = "red";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "red";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "red";
        }
        "break"
        {
          type = "cpu";
          format = "{name} ({cores-logical}) @ {freq-max}";
          key = "CPU  ";
          keyColor = "green";
        }
        {
          type = "gpu";
          format = "{vendor} {name} @ {frequency}";
          key = " ├ 󰢮 ";
          keyColor = "green";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "green";
        }
        {
          type = "battery";
          format = "{capacity} {capacity-bar}";
          key = " └ 󰁾 ";
          keyColor = "green";
          percent = {
            type = 3;
          };
        }
        "break"
        {
          type = "uptime";
          key = "Uptime";
          keyColor = "yellow";
        }
        {
          type = "command";
          key = " └   ";
          keyColor = "yellow";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
      ];
    };
  };
}

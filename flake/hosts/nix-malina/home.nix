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

  wayland.windowManager.river = let
    locked = {
      "None XF86AudioRaiseVolume" = "spawn '${pkgs.pamixer}/bin/pamixer -i 2'";
      "None XF86AudioLowerVolume" = "spawn '${pkgs.pamixer}/bin/pamixer -d 2'";
      "None XF86AudioMute" = "spawn '${pkgs.pamixer}/bin/pamixer --toggle-mute'";

      "None XF86AudioMedia" = "spawn '${pkgs.playerctl}/bin/playerctl play-pause'";
      "None XF86AudioPlay" = "spawn '${pkgs.playerctl}/bin/playerctl play-pause'";
      "None XF86AudioPrev" = "spawn '${pkgs.playerctl}/bin/playerctl previous'";
      "None XF86AudioNext" = "spawn '${pkgs.playerctl}/bin/playerctl next'";
    };
    trim = str: builtins.substring 1 (builtins.stringLength str - 1) str;
  in {
    enable = true;
    settings = {
      keyboard-layout = ''-options "caps:escape" de'';
      set-repeat = "50 300";
      focus-follows-cursor = "always";
      set-cursor-warp = "on-focus-change";
      border-color-focused = "0x${trim hex.teal}";
      border-color-unfocused = "0x${trim hex.base}";
      rule-add = ["-app-id 'galculator' float"];
      default-layout = "rivertile";
      spawn = [
        "${pkgs.hyprpaper}/bin/hyprpaper"
        "${pkgs.waybar}/bin/waybar"
      ];
      map = {
        locked = locked;
        normal =
          {
            "Super Return" = "spawn ${pkgs.kitty}/bin/kitty";
            "Super W" = "spawn ${pkgs.firefox}/bin/firefox";
            "Super N" = "spawn ${pkgs.xfce.thunar}/bin/thunar";
            "Super D" = "spawn ${pkgs.rofi-wayland}/bin/rofi -show drun";
            "Super Q" = "close";
            "Super+Shift E" = "exit";
            "Super J" = "focus-view next";
            "Super K" = "focus-view previous";
            "Super+Shift J" = "swap next";
            "Super+Shift K" = "swap previous";
            "Super+Shift Return" = "zoom";
            "Super H" = ''send-layout-cmd rivertile "main-ratio -0.02"'';
            "Super L" = ''send-layout-cmd rivertile "main-ratio +0.02"'';
            "Super+Shift H" = ''send-layout-cmd rivertile "main-cound +1"'';
            "Super+Shift L" = ''send-layout-cmd rivertile "main-ratio -1"'';
            "Super+Alt H" = "move left 100";
            "Super+Alt J" = "move down 100";
            "Super+Alt K" = "move up 100";
            "Super+Alt L" = "move right 100";
            "Super+Alt+Control H" = "snap left";
            "Super+Alt+Control J" = "snap down";
            "Super+Alt+Control K" = "snap up";
            "Super+Alt+Control L" = "snap right";
            "Super+Alt+Shift H" = "resize horizontal -100";
            "Super+Alt+Shift J" = "resize vertical 100";
            "Super+Alt+Shift K" = "resize vertical -100";
            "Super+Alt+Shift L" = "resize horizontal 100";
            "Super Space" = "toggle-float";
            "Super F" = "toggle-fullscreen";

            "Super Up" = ''send-layout-cmd rivertile "main-location top"'';
            "Super Right" = ''send-layout-cmd rivertile "main-location right"'';
            "Super Down" = ''send-layout-cmd rivertile "main-location bottom"'';
            "Super Left" = ''send-layout-cmd rivertile "main-location left"'';
          }
          // locked;
      };
      map-pointer.normal = {
        "Super BTN_LEFT" = "move-view";
        "Super BTN_RIGHT" = "resize-view";
        "Super BTN_MIDDLE" = "toggle-float";
      };
    };
    extraConfig = ''
      for i in $(seq 1 9)
      do
          tags=$((1 << ($i - 1)))
          riverctl map normal Super $i set-focused-tags $tags
          riverctl map normal Super+Shift $i set-view-tags $tags
          riverctl map normal Super+Control $i toggle-focused-tags $tags
          riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
      done
      all_tags=$(((1 << 32) - 1))
      riverctl map normal Super 0 set-focused-tags $all_tags
      riverctl map normal Super+Shift 0 set-view-tags $all_tags
      rivertile -view-padding 5 -outer-padding 5 -main-ratio 0.75 &
    '';
  };

  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        layer = "top";
        modules-left = ["river/tags"];
        modules-center = ["custom/playerctl"];
        modules-right = ["pulseaudio" "clock"];

        pulseaudio = {
          tooltip = false;
          scroll-step = 1;
          format = "{icon} {volume}%";
          format-muted = "{icon} {volume}%";
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          format-icons.default = ["" ""];
        };

        "custom/playerctl" = {
          on-click = "${pkgs.playerctl}/bin/playerctl play-pause";
          interval = 2;
          exec = "${pkgs.playerctl}/bin/playerctl metadata title";
          format = "  {}";
        };
      };
    };
    style = ../../noneNix/waybar-style.css;
  };

  home.file.".peaclock/config".text = ''
    set seconds on
    style active-bg ${hex.teal}
    style date ${hex.teal}
  '';
}

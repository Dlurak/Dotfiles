{pkgs, ...}: let
  mainMod = "SUPER";
  secondMod = "SUPER ALT";

  rules = import ./rules.nix;
in {
  bind = let
    screenshotNotify = pkgs.writeShellScriptBin "screenshot-notify" ''
      ACTION_VIEW="viewScreenshot"
      ${pkgs.libnotify}/bin/notify-send "File copied and saved" \
      	--app-name="Screenshot" \
      	--action=$ACTION_VIEW="View" |
      	while read -r action; do
      		if [[ "$action" == $ACTION_VIEW ]]; then
      			xdg-open ~/Pictures/screenshot.png
      		fi
      	done
    '';
  in [
    "${secondMod}, h, changegroupactive, b"
    "${secondMod}, l, changegroupactive, b"
    "${secondMod}, left, changegroupactive, b"
    "${secondMod}, right, changegroupactive, f"

    "${mainMod}, Return, exec, ${pkgs.ghostty}/bin/ghostty"
    "${mainMod} SHIFT, Return, exec, ${pkgs.kitty}/bin/kitty"
    "${mainMod}, D, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun"
    "${mainMod}, W, exec, ${pkgs.firefox}/bin/firefox"
    "${mainMod} SHIFT, W, exec, ${pkgs.chromium}/bin/chromium"
    "${mainMod}, N, exec, ${pkgs.nautilus}/bin/nautilus"
    "${mainMod} SHIFT, N, exec, ${pkgs.xfce.thunar}/bin/thunar"

    "${mainMod}, U, exec, ${pkgs.hyprlock}/bin/hyprlock"
    "${mainMod} SHIFT, U, exec, ags toggle power"
    "${mainMod} SHIFT, C, exec, ${pkgs.hyprpicker}/bin/hyprpicker | ${pkgs.wl-clipboard}/bin/wl-copy"

    "${mainMod} SHIFT, E, exec, ${pkgs.smile}/bin/smile"

    # screenshot
    "${mainMod} SHIFT, S, exec, ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" ~/Pictures/screenshot.png && cat ~/Pictures/screenshot.png | ${pkgs.wl-clipboard}/bin/wl-copy && ${screenshotNotify}/bin/screenshot-notify"
    "${mainMod}, S, exec, ${pkgs.grim}/bin/grim ~/Pictures/screenshot.png && cat ~/Pictures/screenshot.png | ${pkgs.wl-clipboard}/bin/wl-copy && ${screenshotNotify}/bin/screenshot-notify"

    "${mainMod} SHIFT, Space, togglefloating"
    "${mainMod}, Space, centerwindow"
    "${secondMod}, Space, pin"

    "${mainMod}, Q, killactive,"
    "${mainMod}, F, fullscreen, 1"
    "${mainMod} SHIFT, F, fullscreen, 0"

    "${mainMod}, T, togglegroup"
    "${mainMod} SHIFT, T, lockgroups, toggle"
    "${mainMod}, E, togglesplit,"

    # TODO: Write a loop to define h and left at once
    "${mainMod}, h, movefocus, l"
    "${mainMod}, l, movefocus, r"
    "${mainMod}, k, movefocus, u"
    "${mainMod}, j, movefocus, d"
    "${mainMod}, left, movefocus, l"
    "${mainMod}, right, movefocus, r"
    "${mainMod}, up, movefocus, u"
    "${mainMod}, down, movefocus, d"

    "${mainMod} SHIFT, h, movewindow, l"
    "${mainMod} SHIFT, j, movewindow, d"
    "${mainMod} SHIFT, k, movewindow, u"
    "${mainMod} SHIFT, l, movewindow, r"

    "${mainMod} SHIFT, left, movewindow, l"
    "${mainMod} SHIFT, down, movewindow, d"
    "${mainMod} SHIFT, up, movewindow, u"
    "${mainMod} SHIFT, right, movewindow, r"

    "${mainMod}, 1, workspace, 1"
    "${mainMod}, 2, workspace, 2"
    "${mainMod}, 3, workspace, 3"
    "${mainMod}, 4, workspace, 4"
    "${mainMod}, 5, workspace, 5"
    "${mainMod}, 6, workspace, 6"
    "${mainMod}, 7, workspace, 7"
    "${mainMod}, 8, workspace, 8"
    "${mainMod}, 9, workspace, 9"
    "${mainMod}, 0, workspace, 10"

    "${mainMod} SHIFT, 1, movetoworkspace, 1"
    "${mainMod} SHIFT, 2, movetoworkspace, 2"
    "${mainMod} SHIFT, 3, movetoworkspace, 3"
    "${mainMod} SHIFT, 4, movetoworkspace, 4"
    "${mainMod} SHIFT, 5, movetoworkspace, 5"
    "${mainMod} SHIFT, 6, movetoworkspace, 6"
    "${mainMod} SHIFT, 7, movetoworkspace, 7"
    "${mainMod} SHIFT, 8, movetoworkspace, 8"
    "${mainMod} SHIFT, 9, movetoworkspace, 9"
    "${mainMod} SHIFT, 0, movetoworkspace, 10"

    "${mainMod}, mouse_down, workspace, e+1"
    "${mainMod}, mouse_up, workspace, e-1"

    "${mainMod}, Tab, workspace, previous"

    "${mainMod}, Y, exec, ags toggle controll-center"
    "${mainMod} SHIFT, Y, exec, ags toggle bar"
    "${mainMod}, F9, exec, ${pkgs.rofi-wayland}/bin/rofi -show window"
  ];
  binde = [
    "${secondMod}, h, resizeactive, -5 0"
    "${secondMod}, j, resizeactive, 0 5"
    "${secondMod}, k, resizeactive, 0 -5"
    "${secondMod}, l, resizeactive, 5 0"
    "${secondMod}, left, resizeactive, -5 0"
    "${secondMod}, down, resizeactive, 0 5"
    "${secondMod}, up, resizeactive, 0 -5"
    "${secondMod}, right, resizeactive, 5 0"
  ];
  bindm = [
    "${mainMod}, mouse:272, movewindow"
    "${mainMod}, mouse:273, resizewindow"
  ];
  bindel = [
    ", XF86AudioLowerVolume, exec, ${pkgs.pamixer}/bin/pamixer -d 2"
    ", XF86AudioRaiseVolume, exec, ${pkgs.pamixer}/bin/pamixer -i 2"
    ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl set +5%"
    ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set 5%-"
  ];
  bindl = [
    ", XF86AudioMute, exec, ${pkgs.pamixer}/bin/pamixer -t"
    "${mainMod}, M, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify play-pause"
  ];
  windowrulev2 = rules.windowrulev2;
  windowrule = rules.windowrule;
}

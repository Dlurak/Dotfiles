{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let
  lock = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
  lockWarning = 30;
  lockDarkening = 15;
  lockTimeout = 60 * 5;
  suspendTimeout = 60 * 10;
  bright = inputs.bright.packages.${pkgs.stdenv.hostPlatform.system}.bright;
in
{
  options = {
    homeManagerModules.hypridle.enable = lib.mkEnableOption "Enable hypridle (config)";
  };

  config = lib.mkIf config.homeManagerModules.hypridle.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = lock;
          before_sleep_cmd = lock;
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          {
            timeout = lockTimeout - lockWarning;
            on-timeout = "${pkgs.libnotify}/bin/notify-send -t 3000 'Locking' 'This computer locks in ${toString lockWarning} seconds' -a Autolock";
          }
          {
            timeout = lockTimeout - lockDarkening;
            on-timeout = "${bright}/bin/bright --easing 'x^3' set 25% --save --duration 600ms";
            on-resume = "${bright}/bin/bright --easing 'x^3' set restore --duration 600ms";
          }
          {
            timeout = lockTimeout;
            on-timeout = lock;
          }
          {
            timeout = suspendTimeout;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}

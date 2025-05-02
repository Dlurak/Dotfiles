{
  pkgs,
  config,
  lib,
  ...
}: let
  lock = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
  lockWarning = 30;
  lockDarkening = 15;
  lockTimeout = 60 * 5;
  suspendTimeout = 60 * 10;
in {
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
            on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl set 2% --save";
            on-resume = "${pkgs.brightnessctl}/bin/brightnessctl --restore";
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

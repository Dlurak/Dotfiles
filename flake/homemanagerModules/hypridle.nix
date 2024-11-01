{
  pkgs,
  config,
  lib,
  ...
}: let
  lock = "pidof hyprlock || hyprlock";
  lockWarning = 30;
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
            on-timeout = "${pkgs.libnotify}/bin/notify-send -t 3000 'Locking' 'This computer locks in ${toString lockWarning} seconds'";
          }
          {
            timeout = lockTimeout;
            on-timeout = lock;
          }
          {
            timeout = suspendTimeout;
            on-timeout = "systemctl suspend-then-hibernate";
          }
        ];
      };
    };
  };
}

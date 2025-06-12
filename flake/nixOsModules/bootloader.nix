{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    bootloader.enableSystemdBoot = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    boot.loader.grub.enable = false;

    boot.loader.systemd-boot.enable = config.bootloader.enableSystemdBoot;
    boot.loader.efi.canTouchEfiVariables = config.bootloader.enableSystemdBoot;
    boot.loader.timeout = 3;
  };
}

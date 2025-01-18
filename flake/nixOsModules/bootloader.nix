{
  lib,
  config,
  ...
}: {
  options = {
    bootloader.enableSystemdBoot = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
    bootloader.enableRaspberryPi = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    boot.loader.grub.enable = false;

    boot.loader.systemd-boot.enable = config.bootloader.enableSystemdBoot;
    boot.loader.efi.canTouchEfiVariables = config.bootloader.enableSystemdBoot;

    boot.loader.generic-extlinux-compatible.enable = config.bootloader.enableRaspberryPi;
  };
}

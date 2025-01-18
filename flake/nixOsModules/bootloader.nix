{
  lib,
  config,
  ...
}: {
  options = {
    bootloader.enableSystemdBoot = lib.mkEnableOption "Enable the bootloader";
    bootloader.enableRaspberryPi = lib.mkEnableOption "Enable the bootloader";
  };

  config = lib.mkIf config.bootloader.enableSystemdBoot {
	boot.loader.grub.enable = false;

    boot.loader.systemd-boot.enable = config.bootloader.enableSystemdBoot;
    boot.loader.efi.canTouchEfiVariables = config.bootloader.enableSystemdBoot;

	boot.loader.generic-extlinux-compatible.enable = config.bootloader.enableRaspberryPi;
  };
}

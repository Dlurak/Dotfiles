{
  lib,
  config,
  ...
}: {
  options = {
    bootloader.enable = lib.mkEnableOption "Enable the bootloader";
  };

  config = lib.mkIf config.bootloader.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}

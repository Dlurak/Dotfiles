{
  lib,
  config,
  ...
}: {
  options = {
    powerOff.enable = lib.mkEnableOption "Enable the poweroff config";
  };
  config = lib.mkIf config.powerOff.enable {
    services.logind.powerKey = "suspend";
    services.upower = {
      enable = true;
      criticalPowerAction = "Hibernate";
      percentageLow = 10;
      percentageCritical = 8;
      percentageAction = 7;
    };
  };
}

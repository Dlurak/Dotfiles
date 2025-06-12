{
  lib,
  config,
  ...
}:
{
  options = {
    networkModule.enable = lib.mkEnableOption "Enable the custom network module";
    networkModule.hostName = lib.mkOption {
      type = lib.types.str;
      default = "homie";
      description = "The hostname";
    };
  };

  config = lib.mkIf config.networkModule.enable {
    networking.hostName = config.networkModule.hostName;
    networking.networkmanager.enable = true;
    # Allow for `http://👻` thx to @elmo@chaos.social
    networking.hosts = {
      "127.0.0.1" = [
        "xn--9q8h"
        "localghost"
      ];
    };
  };
}

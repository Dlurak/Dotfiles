{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    airplay.enable = lib.mkEnableOption "Enable airplay receiver";
  };
  config = lib.mkIf config.airplay.enable {
    services.avahi = {
      enable = true;
      nssmdns = true; # printing
      openFirewall = true; # ensuring that firewall ports are open as needed
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
        userServices = true;
        domain = true;
      };
    };
    firewall = {
      enable = true;
      tcp = [
        7000
        7001
        7100
      ];
      udp = [
        5353
        6000
        6001
        7011
      ];
    };
    environment.systemPackages = [ pkgs.uxplay ];
  };
}

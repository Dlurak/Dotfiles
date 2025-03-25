{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.desktop.entertainment.enable = lib.mkEnableOption "Enable entertainment programs";
  };

  config = lib.mkIf config.program.desktop.browsers.enable {
    environment.systemPackages = with pkgs; [
      (ani-cli.override {withVlc = true; withMpv = false;})
    ];
  };
}

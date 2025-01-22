{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.desktop.chatting.enable = lib.mkEnableOption "Enable chatting programs";
  };

  config = lib.mkIf config.program.desktop.chatting.enable {
    environment.systemPackages = with pkgs;
      [
        zulip
        element-desktop
        signal-desktop
        whatsapp-for-linux
      ]
      ++ (
        if pkgs.stdenv.isx86_64
        then [discord]
        else []
      );
  };
}

{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    program.desktop.graphics.enable = lib.mkEnableOption "Enable graphics programs";
  };

  config = lib.mkIf config.program.desktop.graphics.enable {
    environment.systemPackages = with pkgs; [
      eog
      shotwell
	  cheese
      inkscape
      gimp3
      sly
      krita
      ffmpeg
    ];
  };
}

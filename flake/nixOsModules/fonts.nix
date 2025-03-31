{
  lib,
  pkgs,
  config,
  ...
}: let
  customFonts = import ./fonts {inherit pkgs lib;};
in {
  options = {
    fontsModule.enable = lib.mkEnableOption "Enable the custom fonts module";
  };

  config = lib.mkIf config.fontsModule.enable {
    fonts.packages =
      (with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        liberation_ttf
        fira-code
        fira-code-symbols
        fira-math
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        nerd-fonts.jetbrains-mono
        jetbrains-mono
        barlow
        source-sans-pro
      ])
      ++ (with customFonts; [
        pilowlava
        spaceGrotesk
        SF-Pro
      ]);
  };
}

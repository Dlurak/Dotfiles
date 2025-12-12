{
  lib,
  pkgs,
  config,
  ...
}:
let
  customFonts = import ./fonts { inherit pkgs lib; };
in
{
  options = {
    fontsModule.enable = lib.mkEnableOption "Enable the custom fonts module";
  };

  config = lib.mkIf config.fontsModule.enable {
    fonts.packages =
      (with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        liberation_ttf
        fira-sans
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
        times-newer-roman
      ])
      ++ (with customFonts; [
        pilowlava
		modak
        spaceGrotesk
        SF-Pro
      ]);
  };
}

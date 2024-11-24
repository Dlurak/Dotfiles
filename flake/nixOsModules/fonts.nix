{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    fontsModule.enable = lib.mkEnableOption "Enable the custom fonts module";
  };

  config = lib.mkIf config.fontsModule.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      nerdfonts
      jetbrains-mono
      (import ./derivations/pilowlava.nix {
        pkgs = pkgs;
      })
      (import ./derivations/spaceGrotesk.nix {
        pkgs = pkgs;
      })
    ];
  };
}

{
  pkgs,
  lib,
}: let
  stdenv = pkgs.stdenvNoCC;
  mkFontDerivations = builtins.mapAttrs (
    name: src:
      if builtins.isPath src
      then import ./mkFont.nix {inherit stdenv name src;}
      else src
  );
in (mkFontDerivations {
  pilowlava = ../../assets/fonts/Pilowlava-Regular.otf;
  spaceGrotesk = ../../assets/fonts/space-grotesk;
  "SF-Pro" = import ./sfPro.nix {inherit pkgs stdenv lib;};
})

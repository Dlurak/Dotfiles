{pkgs, ...}:
import ../../utils/mkFontDerivation.nix {
  stdenv = pkgs.stdenvNoCC;
  src = ../../assets/fonts/space-grotesk;
  name = "spaceGrotesk";
}

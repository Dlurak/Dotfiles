{pkgs, ...}:
import ../../utils/mkFontDerivation.nix {
  stdenv = pkgs.stdenvNoCC;
  src = ../../assets/fonts/Pilowlava-Regular.otf;
  name = "pilowlava";
}

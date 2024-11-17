# 38c3 specific
# TODO: Create a ccc.38c3 flag to enable/disable 38c3 related things
{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  pname = "pilowlava";
  version = "1.0.0";

  src = ../../assets/Pilowlava-Regular.otf;
  dontUnpack = true;

  buildInputs = [];

  installPhase = ''
    mkdir -p $out/share/fonts
    cp $src $out/share/fonts/
  '';
}

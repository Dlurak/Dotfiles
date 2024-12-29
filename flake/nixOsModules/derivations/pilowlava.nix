# 38c3 specific
{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  pname = "pilowlava";
  version = "1.0.0";

  src = ../../assets/fonts/Pilowlava-Regular.otf;
  dontUnpack = true;

  buildInputs = [];

  installPhase = ''
    mkdir -p $out/share/fonts
    cp $src $out/share/fonts/
  '';
}

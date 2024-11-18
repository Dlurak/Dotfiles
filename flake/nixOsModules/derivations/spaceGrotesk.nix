# 38c3 specific
# TODO: Create a ccc.38c3 flag to enable/disable 38c3 related things
{pkgs, ...}:
pkgs.stdenv.mkDerivation {
  pname = "spaceGrotesk";
  version = "1.0.0";

  src = ../../assets/fonts/space-grotesk;
  dontUnpack = true;

  buildInputs = [];

  installPhase = ''
    mkdir -p $out/share/fonts
    cp -r $src $out/share/fonts/
  '';
}

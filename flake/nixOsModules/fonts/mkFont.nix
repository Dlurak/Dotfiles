{
  src,
  stdenv,
  name,
}:
stdenv.mkDerivation {
  pname = name;
  dontUnpack = true;
  version = "1.0.0";
  inherit src;
  buildInputs = [];
  installPhase = ''
    mkdir -p $out/share/fonts
    cp -r $src $out/share/fonts
  '';
}

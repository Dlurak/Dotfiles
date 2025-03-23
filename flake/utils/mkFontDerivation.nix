{
  stdenv,
  src,
  name,
  dontUnpack ? true,
  version ? "1.0.0",
}:
stdenv.mkDerivation {
  pname = name;

  inherit dontUnpack version src;

  buildInputs = [];
  installPhase = ''
    mkdir -p $out/share/fonts
    cp -r $src $out/share/fonts/
  '';
}

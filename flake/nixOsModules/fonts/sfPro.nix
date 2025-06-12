{
  pkgs,
  lib,
  stdenv,
}:
stdenv.mkDerivation {
  pname = "SF-Pro";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "sahibjotsaggu";
    repo = "San-Francisco-Pro-Fonts";
    rev = "8bfea09aa6f1139479f80358b2e1e5c6dc991a58";
    sha256 = "sha256-mAXExj8n8gFHq19HfGy4UOJYKVGPYgarGd/04kUIqX4=";
  };

  nativeBuildInputs = with pkgs; [ unzip ];

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    mkdir -p $out/share/fonts/truetype
    cp *.otf $out/share/fonts/opentype
    cp *.ttf $out/share/fonts/truetype
  '';

  meta = with lib; {
    description = "San Francisco Pro Fonts";
    homepage = "https://github.com/sahibjotsaggu/San-Francisco-Pro-Fonts";
    license = licenses.mit;
    maintainers = [ maintainers.sahibjotsaggu ];
  };
}

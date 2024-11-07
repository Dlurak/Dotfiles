{pkgs, ...}: let
    description = "Filius network simulator";
in
pkgs.stdenv.mkDerivation rec {
  pname = "filius";
  version = "2.6.1";

  src = pkgs.fetchurl {
    url = "http://www.lernsoftware-filius.de/downloads/Setup/${pname}-${version}.zip";
    sha256 = "4e4d4f7d139d8a2a41b33e29f4a8a7f105a07d1627f46cc75200e10108779549";
  };

  sourceRoot = ".";

  buildInputs = [pkgs.unzip];

  buildPhase = ''
    rm filius.sh
    echo '#!/bin/sh' > filius
    echo '[ -n "\$\{WAYLAND_DISPLAY}" ] && export _JAVA_AWT_WM_NONREPARENTING=1' >> filius
    echo "${pkgs.openjdk}/bin/java -jar $out/bin/artifacts/filius.jar" >> filius
  '';

  installPhase = ''
    mkdir -p $out/bin/artifacts
    cp filius $out/bin/
    cp -r ./* $out/bin/artifacts

    chmod +x $out/bin/filius

	mkdir -p $out/share/applications
    cat > $out/share/applications/${pname}.desktop <<EOF
[Desktop Entry]
Version=${version}
Name=${pname}
Comment=${description}
Exec=$out/bin/filius
Icon=application-network
Terminal=false
Type=Application
Categories=Education;Network;
MimeType=x-scheme-handler/file;
StartupNotify=true
EOF
  '';

  meta.description = description;
}

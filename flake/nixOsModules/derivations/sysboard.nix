{ lib, pkgs }:
pkgs.stdenv.mkDerivation (finalAttrs: {
  pname = "sysboard";
  version = "9.9.9";

  src = pkgs.fetchFromGitHub {
    owner = "System64fumo";
    repo = "sysboard";
    rev = "90ceddb67bcf3a609e7892bc67e8c7ca806b85bc";
    sha256 = "sha256-bK4izhMzt9ZwlyQodyZWv9JEiFpbsh8XtluWcWmOIao=";
  };

  postPatch = ''
    substituteInPlace Makefile \
      --replace-fail pkg-config ''${PKG_CONFIG}
    substituteInPlace src/main.cpp \
      --replace-fail /usr/share/sys64/board/config.conf $out/share/sys64/board/config.conf
    substituteInPlace src/window.cpp \
      --replace-fail /usr/share/sys64/board/style.css $out/share/sys64/board/style.css
  '';

  nativeBuildInputs = with pkgs; [pkg-config wayland-scanner wrapGAppsHook4];
  buildInputs = with pkgs; [gtkmm4 gtk4-layer-shell];

  configurePhase = ''
    runHook preConfigure
    echo '#define GIT_COMMIT_MESSAGE "${finalAttrs.src.rev}"' >> src/git_info.hpp
    echo '#define GIT_COMMIT_DATE "${lib.removePrefix "0-unstable-" finalAttrs.version}"' >> src/git_info.hpp
    runHook postConfigure
  '';

  makeFlags = [
    "DESTDIR=${placeholder "out"}"
    "PREFIX="
  ];

  postInstall = ''
    wrapProgram $out/bin/sysboard --prefix LD_LIBRARY_PATH : $out/lib
  '';

  meta = with lib; {
    description = "Simple virtual keyboard for Wayland";
    homepage = "https://github.com/System64fumo/sysboard";
    license = licenses.wtfpl;
    platforms = platforms.linux;
    maintainers = with maintainers; [ dlurak ];
  };
})

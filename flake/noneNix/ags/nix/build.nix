{ pkgs, ags }:
let
  entry = "app.ts";
  pname = "tokyo-shell";

  extraPackages = import ./extrapkgs.nix { inherit pkgs ags; };
in
pkgs.stdenv.mkDerivation {
  name = pname;
  src = ./..;

  nativeBuildInputs = with pkgs; [
    wrapGAppsHook3
    gobject-introspection
    ags.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  buildInputs = extraPackages ++ [ pkgs.gjs ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mkdir -p $out/share
    cp -r * $out/share
    ags bundle ${entry} $out/bin/${pname} -d "SRC='$out/share'"

    runHook postInstall
  '';
}

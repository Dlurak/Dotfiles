{ pkgs, ... }:
let
  owner = "blinry";
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = "habitctl";
  version = "0.3.2";

  useFetchCargoVendor = true;
  cargoHash = "sha256-sqAI2d7oHlGGIC2ddZJfj8RzfHR+57OgCVDRHayghJ4=";
  src = pkgs.fetchFromGitHub {
    owner = "blinry";
    repo = "habitctl";
    rev = "99ede345c1da717d936d0367f6dc9c8053d7e254";
    hash = "sha256-O0wF5LkWCPdLO8sELtu1HAn1fD2GhV9ZR8jF69nkatM=";
  };

  meta = {
    description = "Minimalist command line tool you can use to track and examine your habits.";
    mainProgram = pname;
    homepage = "https://github.com/${owner}/${pname}";
  };
}

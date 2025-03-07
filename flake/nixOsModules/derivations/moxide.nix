{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "moxide";
  version = "0.2.0";

  useFetchCargoVendor = true;
  cargoHash = "sha256-nHp5KSU1mzsr3t8diREhs5fbxrJcJaEpciZNKCkmp5A=";
  src = pkgs.fetchFromGitHub {
    owner = "dlurak";
    repo = "moxide";
    rev = "v${version}";
    hash = "sha256-f3suE8Gz7V62+O1J3W+Ps2HhVCAhRmxRFfrB2Lc1Tz4=";
  };

  meta = {
    description = "Tmux session manager with a modular configuration";
    mainProgram = "moxide";
    homepage = "https://github.com/dlurak/moxide";
  };

  doCheck = true;
}

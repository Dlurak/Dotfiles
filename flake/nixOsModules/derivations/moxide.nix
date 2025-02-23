{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "moxide";
  version = "0.2.0";

  cargoHash = "sha256-TEoy2Jae7QV3MlZokAmWgwy9q0XBIxC17Ns9RJTZoeU=";
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

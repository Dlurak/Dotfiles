{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage {
  pname = "muxbar";
  version = "0.1.0";

  cargoHash = "sha256-MFCFv75y33xJIkhnKRSuKI881Y2233OFggltVcmG6pw=";
  src = pkgs.fetchFromGitHub {
    owner = "dlurak";
    repo = "muxbar";
    rev = "25abcf93b32467b71e1ba7cfe6ec9092cc2acaad";
    sha256 = "sha256-0QujZv8ot3Wz9I7Mlu9kPpVukKIFlfnCicgYB5GwLbY=";
  };

  meta = {
    description = "Tmux status bar configured in rust";
    mainProgram = "muxbar";
    homepage = "https://github.com/dlurak/muxbar";
  };

  doCheck = true;
}

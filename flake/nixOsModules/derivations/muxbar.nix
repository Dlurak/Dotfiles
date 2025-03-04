{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage {
  pname = "muxbar";
  version = "0.1.0";

  cargoHash = "sha256-oOtu5nH0kk2/mELCFCIEeKLd0uHI70Y8/ny7Q6/j9I4=";
  src = pkgs.fetchFromGitHub {
    owner = "dlurak";
    repo = "muxbar";
    rev = "8cc28e707f1280283a117e8ddaf74cb9512c6f4b";
    sha256 = "sha256-Ti+kYGZOnOY89L1Vm4bCtN5mCjlAPPS59F18MqJoJgk=";
  };

  meta = {
    description = "Tmux status bar configured in rust";
    mainProgram = "muxbar";
    homepage = "https://github.com/dlurak/muxbar";
  };

  doCheck = true;
}

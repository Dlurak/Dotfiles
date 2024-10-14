{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "moxide";
  version = "0.1.0";

  cargoSha256 = "sha256-MqJ3lxnzvvmNXEMgx0su8vRDXAZbNtPuuphNzjeMN+w=";
  src = pkgs.fetchFromGitHub {
    owner = "dlurak";
    repo = "m";
    rev = "v${version}";
    sha256 = "09awvsdw27380d3481pxw4hjqpjy36ad45c750dcxfzal4qir0ax";
  };

  meta = {
    description = "Tmux status bar configured in rust";
    mainProgram = "muxbar";
    homepage = "https://github.com/dlurak/muxbar";
  };

  doCheck = true;
}

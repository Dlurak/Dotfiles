{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage rec {
  pname = "moxide";
  version = "0.1.0";

  cargoHash = "sha256-MqJ3lxnzvvmNXEMgx0su8vRDXAZbNtPuuphNzjeMN+w=";
  src = pkgs.fetchFromGitHub {
    owner = "dlurak";
    repo = "moxide";
    rev = "v${version}";
    sha256 = "09awvsdw27380d3481pxw4hjqpjy36ad45c750dcxfzal4qir0ax";
  };

  meta = {
    description = "Tmux session manager with a modular configuration";
    mainProgram = "moxide";
    homepage = "https://github.com/dlurak/moxide";
  };

  doCheck = true;
}

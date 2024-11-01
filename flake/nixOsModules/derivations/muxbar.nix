{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage {
  pname = "muxbar";
  version = "0.1.0";

  cargoSha256 = "sha256-xW9wYw99arc7Xy2nLrkSPrj9a7K+oHz5nG4qe/21/hs=";
  src = pkgs.fetchFromGitHub {
    owner = "dlurak";
    repo = "muxbar";
    rev = "80d3077b6294c944138da4e2099cfa47a13ec3cf";
    sha256 = "sha256-A076DFNCrMSHXsC52tPwUq0zs3iOcg5Qi7hmeCcFKzk=";
  };

  meta = {
    description = "Tmux status bar configured in rust";
    mainProgram = "muxbar";
    homepage = "https://github.com/dlurak/muxbar";
  };

  doCheck = true;
}

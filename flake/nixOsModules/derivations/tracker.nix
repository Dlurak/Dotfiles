{ pkgs, ... }:
pkgs.rustPlatform.buildRustPackage {
  pname = "tracker";
  version = "0.1.5";

  src = pkgs.fetchFromGitHub {
    owner = "ShenMian";
    repo = "tracker";
    rev = "97b0e892d7335970812717f66965b5d7abc72765";
    hash = "sha256-Qnc8k4rc0U7ZDjvPxJGJV7ew0c83aXeBi+fGZLhZCFs=";
  };
  cargoHash = "sha256-cif40SeZqWOL2qTtKfxmjqbp3QHF/HtjCy26pfJiRog=";

  nativeBuildInputs = with pkgs; [ pkg-config ];
  buildInputs = with pkgs; [ openssl ];
}

{pkgs, ...}:
pkgs.rustPlatform.buildRustPackage {
  pname = "tracker";
  version = "0.1.5";

  src = pkgs.fetchFromGitHub {
    owner = "ShenMian";
    repo = "tracker";
    rev = "73a31b767b51412d305b34952897ccbcf26bff5b";
    hash = "sha256-gR+Hrqr3CJp0QXy3c6QrMoWzTxFggaPqfWir9zl35hk=";
  };
  cargoHash = "sha256-2xUS/lxwKDAq/ASDkE/gavHxsPcPqFpD93KLgOze+wk=";

  nativeBuildInputs = with pkgs; [pkg-config];
  buildInputs = with pkgs; [openssl];
}

{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    ags.url = "github:aylur/ags";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    ags,
    utils,
  }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      extraPackages = import ./nix/extra-packages.nix {inherit ags pkgs;};
      tokyo-shell = import ./nix/build.nix {inherit ags pkgs;};
    in {
      packages.default = tokyo-shell;
      defaultPackage = tokyo-shell;
      apps = let
        app = {
          type = "app";
          program = "${tokyo-shell}/bin/tokyo-shell";
        };
      in {
        default = app;
        tokyo-shell = app;
      };
      devShells.default = pkgs.mkShell {
        buildInputs = [(ags.packages.${system}.default.override {inherit extraPackages;})];
      };
    });
}

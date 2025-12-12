{ pkgs, ags }:
let
  agspkgs = ags.packages.${pkgs.stdenv.hostPlatform.system};
  astalPackages = import ./astalpkgs.nix { inherit agspkgs; };
in
astalPackages ++ (import ./systempkgs.nix { inherit pkgs; })

{ inputs }:
[
  (import ./general.nix { inherit inputs; })
  (import ./neovim.nix)
]

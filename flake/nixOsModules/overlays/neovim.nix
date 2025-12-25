final: prev:
let
  neovimDeps = import ./neovimDeps.nix { pkgs = final; };
  neovimDepsPaths = map (p: "${p}/bin") neovimDeps;
in
{
  neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs (old: {
    version = "0.12.0-dev";
    src = final.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "ce7ed53fbae3ebc643bce5ad8aa94c20ebc19b25";
      hash = "sha256-hlpyP59PTtQmyCDRX+XCYReXOBtfUSkX88A5nlfmu6g=";
    };
  });
  neovim = prev.neovim.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ prev.buildPackages.makeWrapper ];

    postInstall =
      let
        paths = builtins.concatStringsSep ":" neovimDepsPaths;
      in
      ''
        wrapProgram $out/bin/nvim \
          --prefix PATH : "${paths}"
      '';
  });
}

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
      rev = "38986188ba0f57c48065ad430706435d622911a1";
      hash = "sha256-SeIkPx9OItyZvydY17RNb0R/r/eSMuHZnBvH8fqVKo0=";
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

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
      rev = "3d1f907912e25cb7a83163423c75dc67a0aea126";
      hash = "sha256-jnub4ZUkfqoKpYEqZhfESoC6dpMwclumxD1xYUhnpkA=";
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

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
      rev = "0d658660c29e920e74c4dade3819d80dccad0dde";
      hash = "sha256-UWQpnJ46TMdnB4TUFuYZ3qhZaIttXYuGuWnn+MdpRQU=";
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

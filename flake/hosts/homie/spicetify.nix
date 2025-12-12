{
  pkgs,
  lib,
  spicetify-nix,
  ...
}:
{
  imports = [ spicetify-nix.homeManagerModules.default ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  programs.spicetify =
    let
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        fullAppDisplay
        hidePodcasts
        keyboardShortcut
        songStats
      ];
      enabledCustomApps = [ ];
    };
}

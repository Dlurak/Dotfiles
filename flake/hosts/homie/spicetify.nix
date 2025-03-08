{
  pkgs,
  lib,
  spicetify-nix,
  ...
}: {
  imports = [spicetify-nix.homeManagerModules.default];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  programs.spicetify = let
    tokyonightTheme = pkgs.fetchFromGitHub {
      owner = "Gspr-bit";
      repo = "Spotify-Tokyo-Night-Theme";
      rev = "d88ca06eaeeb424d19e0d6f7f8e614e4bce962be";
      hash = "sha256-cLj9v8qtHsdV9FfzV2Qf4pWO8AOBXu51U/lUMvdEXAk=";
    };
    spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      fullAppDisplay
      keyboardShortcut
      hidePodcasts
      songStats
    ];
    enabledCustomApps = [spicePkgs.apps.lyricsPlus];
    theme = {
      name = "Tokyo";
      src = tokyonightTheme;
      injectCss = true;
      replaceColors = true;
      overwriteAssets = true;
      sidebarConfig = true;
      homeConfig = true;
    };
    colorScheme = "Night";
  };
}

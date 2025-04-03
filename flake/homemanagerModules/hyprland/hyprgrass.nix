{
  hyprgrass,
  fetchFromGitHub,
}:
hyprgrass.overrideAttrs
(prev: {
  version = "0.8.2-unstable-2025-04-03";
  src = fetchFromGitHub {
    owner = "horriblename";
    repo = "hyprgrass";
    rev = "e4cad1c7c0b49255bc9186a9c299b31df37e1303";
    hash = "sha256-neGi7FooD+JQfEqRye394QlSYiGGhBzTWiFJ/2neVrM=";
  };
})

{
  hyprgrass,
  fetchFromGitHub,
}:
hyprgrass.overrideAttrs (prev: {
  version = "0.8.2-unstable-2025-04-03";
  src = fetchFromGitHub {
    owner = "horriblename";
    repo = "hyprgrass";
    rev = "9b341353a91c23ced96e5ed996dda62fbe426a32";
    hash = "sha256-Nwd8JwGEEdGBJthxiopK51Fwva5TbM1PEOQDe+NAZEw=";
  };
})

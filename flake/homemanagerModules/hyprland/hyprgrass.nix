{
  hyprgrass,
  fetchFromGitHub,
}:
hyprgrass.overrideAttrs (prev: {
  version = "0.8.2-unstable-2025-04-03";
  src = fetchFromGitHub {
    owner = "horriblename";
    repo = "hyprgrass";
    rev = "f955664aca82dcd9f51d799faab32d8006656c3d";
    hash = "sha256-SmYWv2WXgmaEa8dHfafEbaz5YpX0yxoRa17OC0rz/2U=";
  };
})

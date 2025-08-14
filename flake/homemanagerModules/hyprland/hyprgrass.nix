{
  hyprgrass,
  fetchFromGitHub,
}:
hyprgrass.overrideAttrs (prev: {
  version = "0.8.2-unstable-2025-04-03";
  src = fetchFromGitHub {
    owner = "horriblename";
    repo = "hyprgrass";
    rev = "7dafd92afedda246a9c1c4187784c3fc1d6261e5";
    hash = "sha256-P4tM0eom+p3XE+nqM+uI/s+nH15HfCGCaWOjfdUO1iI=";
  };
})

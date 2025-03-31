{
  ags,
  pkgs,
}:
ags.lib.bundle {
  inherit pkgs;
  extraPackages = import ./extra-packages.nix {inherit ags pkgs;};
  src = ./..;
  name = "tokyo-shell";
  entry = "app.ts";
  gtk4 = false;
}

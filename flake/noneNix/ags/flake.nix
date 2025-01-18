{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    ags.url = "github:aylur/ags";
  };

  outputs = {
    nixpkgs,
    ags,
    ...
  }: let
    system = pkgs.system;
    pkgs = nixpkgs.legacyPackages.${system};
    extraPackages = with ags.packages.${system}; [
      hyprland
      mpris
      battery
      wireplumber
      network
      bluetooth
      powerprofiles
      notifd

      pkgs.hyprpicker
      pkgs.hypridle
      pkgs.hyprsunset
      pkgs.slurp
      pkgs.grim
      pkgs.brightnessctl
      pkgs.libnotify
      pkgs.wlinhibit
      pkgs.wl-clipboard
      pkgs.libnotify

      (
        pkgs.writers.writeBashBin "screenshot-notify"
        (builtins.readFile ./scripts/screenshot-notify.sh)
      )
    ];
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [(ags.packages.${system}.default.override {inherit extraPackages;})];
    };
    packages.${system}.default = ags.lib.bundle {
      inherit pkgs;
      inherit extraPackages;
      src = ./.;
      name = "my-shell";
      entry = "app.ts";
      gtk4 = false;
    };
  };
}

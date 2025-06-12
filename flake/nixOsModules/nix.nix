{
  lib,
  config,
  inputs,
  ...
}:
{
  options = {
    nixModule.enable = lib.mkEnableOption "Enable nix settings";
    nixModule.stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "24.05";
      description = "The state version to use";
    };
  };

  config =
    let
      pkgIsIn = list: pkg: builtins.elem (lib.getName pkg) list;
    in
    lib.mkIf config.nixModule.enable {
      nixpkgs.overlays = import ./overlays { inherit inputs; };

      nixpkgs.config.allowUnfreePredicate = pkgIsIn [ "discord" ];

      nixpkgs.config.permittedInsecurePackages = [ ];

      nix.settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
      system.stateVersion = config.nixModule.stateVersion;
    };
}

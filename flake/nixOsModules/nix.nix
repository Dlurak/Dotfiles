{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: {
  options = {
    nixModule.enable = lib.mkEnableOption "Enable nix settings";
    nixModule.stateVersion = lib.mkOption {
      type = lib.types.str;
      default = "24.05";
      description = "The state version to use";
    };
  };

  config = lib.mkIf config.nixModule.enable {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) ["discord"];
    nixpkgs.config.permittedInsecurePackages = [
      "electron-32.3.3"
    ];
    nixpkgs.overlays = [
      (final: prev: {
        fortune = prev.fortune.override {withOffensive = true;};
        moxide = inputs.moxide.defaultPackage.${pkgs.system};
      })
    ];
    nix.settings.experimental-features = ["nix-command" "flakes"];
    system.stateVersion = config.nixModule.stateVersion;
  };
}

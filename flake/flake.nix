{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:aylur/ags";
  };

  outputs = {nixpkgs,ags, ...} @ inputs: {
    nixosConfigurations.homie = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs ags;};
      modules = [
        ./nixOsModules
        ./hosts/homie/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
    nixosConfigurations.nix-malina = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./nixOsModules
        ./hosts/nix-malina/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}

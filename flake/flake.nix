{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:aylur/ags";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    ags,
    spicetify-nix,
    ...
  } @ inputs: {
    nixosConfigurations.homie = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs ags spicetify-nix;};
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

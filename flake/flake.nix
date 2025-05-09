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
    muxbar = {
      url = "github:dlurak/muxbar/personal-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    retch = {
      url = "github:dlurak/retch";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    moxide = {
      url = "github:dlurak/moxide";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    manada = {
      url = "github:dlurak/manada";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jiman = {
      url = "github:dlurak/jiman";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ferrishot = {
      url = "github:nik-rev/ferrishot/main";
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
  };
}

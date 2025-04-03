{inputs, ...}: {
  imports = [
    (import ./programs {inherit inputs;})
	inputs.manada.nixosModules.x86_64-linux.default
    ./airplay.nix
    ./bootloader.nix
    ./firewall.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
    ./variables.nix
    ./network.nix
	./xdg.nix
	./powerOff.nix
  ];
}

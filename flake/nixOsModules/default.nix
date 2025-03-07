{inputs, ...}: {
  imports = [
    (import ./programs { inputs = inputs; })
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

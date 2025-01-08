{inputs, ...}: {
  imports = [
    (import ./programs { inputs = inputs; })
    ./bootloader.nix
    ./firewall.nix
    ./fonts.nix
    ./locale.nix
    ./nix.nix
	./xdg.nix
    ./variables.nix
    ./network.nix
  ];
}

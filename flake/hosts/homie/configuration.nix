{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  bootloader.enable = true;
  fontsModule.enable = true;

  users.users.dlurak = {
    isNormalUser = true;
    description = "dlurak";
    extraGroups = ["networkmanager" "wheel"];
  };
  users.defaultUserShell = pkgs.zsh;

  locale.enable = true;

  program = {
    cliMinimal.enable = true;
    cliRandom.enable = true;
    desktop.enable = true;
    dev.enable = true;
    funCli.enable = true;
    hypr.enable = true;
    lsp.enable = true;
    utils.enable = true;
    uwu.enable = true;
    school.enable = true;
    zsh.enable = true;
  };

  nixModule.enable = true;

  firewall = {
    enable = true;
    tcp = [];
    udp = [];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  services.power-profiles-daemon.enable = true;

  virtualisation.waydroid.enable = true;

  home-manager = {
    users.dlurak = {...}: {
      imports = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
    backupFileExtension = "backup";
  };
}

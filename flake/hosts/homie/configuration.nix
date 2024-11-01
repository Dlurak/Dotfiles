{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "homie";
  networking.networkmanager.enable = true;

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
    zsh.enable = true;
  };

  nixModule.enable = true;

  firewall = {
    enable = true;
    tcp = [];
    udp = [];
  };

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

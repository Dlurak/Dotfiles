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
  # Allow for `http://👻` thx to @elmo@chaos.social
  networking.hosts = {
    "127.0.0.1" = ["xn--9q8h"];
  };

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

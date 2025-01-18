{
  pkgs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  bootloader = {
    enableSystemdBoot = false;
    enableRaspberryPi = true;
  };

  fontsModule.enable = true;
  powerOff.enable = false;

  networkModule = {
    enable = true;
    hostName = "nix-malina";
  };

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
    desktop.enable = false;
    dev.enable = true;
    funCli.enable = true;
    hypr.enable = true;
    lsp.enable = true;
    utils.enable = true;
    uwu.enable = false;
    school.enable = false;
    zsh.enable = true;
  };

  nixModule.enable = true;

  firewall = {
    enable = true;
    tcp = [];
    udp = [];
  };
  services.openssh.enable = true;

  mime = {
    enable = false;
    apps = {};
  };

  home-manager = {
    users.dlurak = {...}: {
      imports = [./home.nix];
    };
    backupFileExtension = "backup";
  };
}

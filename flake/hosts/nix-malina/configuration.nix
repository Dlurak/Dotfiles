{pkgs, ...}: {
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
    cliRandom.enable = false;
    funCli.enable = true;
    desktop = {
      browsers.enable = true;
      terms.enable = true;
      utils.enable = true;
      chatting.enable = false;
      graphics.enable = false;
      misc.enable = false;
    };
    dev.enable = true;
    hypr.enable = true;
    lsp.enable = true;
    utils.enable = false;
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

{pkgs, ...}: {
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
    hypr.enable = true;
    funCli.enable = true;
    desktop.enable = true;
    utils.enable = true;
    cliMinimal.enable = true;
    dev.enable = true;
    zsh.enable = true;
    cliRandom.enable = true;
  };

  nixModule.enable = true;

  firewall = {
    enable = true;
    tcp = [];
    udp = [];
  };
}

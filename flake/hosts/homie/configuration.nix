{
  pkgs,
  lib,
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

  xdg.terminal-exec = {
    enable = true;
    package = pkgs.kitty;
    settings = {default = ["kitty.desktop"];};
  };

  mime.enable = true;
  mime.list = [
    {
      mimeTypes = ["image/svg+xml"];
      handler = pkgs.inkscape;
    }
    {
      mimeTypes = ["image/png" "image/jpeg" "image/gif" "image/bmp" "image/webp" "image/x-xpixmap" "image/x-tiff" "image/x-photoshop"];
      handler = pkgs.eog;
    }
    {
      mimeTypes = ["application/pdf"];
      handler = pkgs.zathura;
    }
    {
      mimeTypes = ["text/html"];
      handler = pkgs.firefox;
    }
  ];

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
        ../../homemanagerModules/default.nix
      ];
    };
    backupFileExtension = "backup";
  };
}

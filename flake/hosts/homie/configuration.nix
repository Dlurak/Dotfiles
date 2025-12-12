{
  pkgs,
  ags,
  spicetify-nix,
  inputs,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  bootloader.enableSystemdBoot = true;
  fontsModule.enable = true;
  powerOff.enable = true;

  networkModule = {
    enable = true;
    hostName = "homie";
  };

  users.users.dlurak = {
    isNormalUser = true;
    description = "dlurak";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "video"
    ];
  };
  # services.udev.packages = with pkgs; [bright];

  locale.enable = true;

  program = {
    cliMinimal.enable = true;
    cliRandom.enable = true;
    funCli.enable = true;
    desktop = {
      browsers.enable = true;
      chatting.enable = true;
      entertainment.enable = true;
      graphics.enable = true;
      misc.enable = true;
      terms.enable = true;
      utils.enable = true;
    };
    hypr.enable = true;
    utils.enable = true;
    uwu.enable = true;
    school.enable = true;

    zsh.enable = true;
    nu.enable = false;
  };

  nixModule.enable = true;

  airplay.enable = false;
  firewall = {
    enable = true;
    tcp = [ 3000 ];
    udp = [ ];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;


  services = {
    power-profiles-daemon.enable = true;
    fprintd.enable = true;
    printing.enable = true;
	pipewire.wireplumber.enable = true;
  };

  documentation.doc.enable = false;

  virtualisation.waydroid.enable = false;

  mime = {
    enable = true;
    apps = with pkgs; {
      "application/pdf" = "org.gnome.Evince.desktop";
      "image/svg+xml" = inkscape;

      "image/bmp" = eog;
      "image/gif" = eog;
      "image/jpeg" = eog;
      "image/jpg" = eog;
      "image/jxl" = eog;
      "image/pjpeg" = eog;
      "image/png" = eog;
      "image/tiff" = eog;
      "image/webp" = eog;
      "image/x-bmp" = eog;
      "image/x-gray" = eog;
      "image/x-icb" = eog;
      "image/x-ico" = eog;
      "image/x-png" = eog;
      "image/x-portable-anymap" = eog;
      "image/x-portable-bitmap" = eog;
      "image/x-portable-graymap" = eog;
      "image/x-portable-pixmap" = eog;
      "image/x-xbitmap" = eog;
      "image/x-xpixmap" = eog;
      "image/x-pcx" = eog;
      "image/svg+xml-compressed" = eog;
      "image/vnd.wap.wbmp" = eog;
      "image/x-icns" = eog;

      "video/qicktime" = mpv;
      "application/ogg" = mpv;

      "application/gzip" = xournalpp;
    };
  };
  xdg.terminal-exec = {
    enable = true;
    settings.default = [ "kitty.desktop" ];
  };

  services.cron = {
	  enable = true;
	  systemCronJobs = [
		"*/10 * * * * ${pkgs.curl}/bin/curl -s https://dlool.onrender.com > /dev/null"
	  ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs ags spicetify-nix; };
    users.dlurak =
      { ... }:
      {
        imports = [
          ./home.nix
          ./spicetify.nix
        ];
      };
    backupFileExtension = "backup";
  };
}

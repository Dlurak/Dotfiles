{
  pkgs,
  ags,
  spicetify-nix,
  inputs,
  options,
  ...
}: {
  imports = [./hardware-configuration.nix];

  bootloader = {
    enableSystemdBoot = true;
    enableRaspberryPi = false;
  };
  fontsModule.enable = true;
  powerOff.enable = true;

  networkModule = {
    enable = true;
    hostName = "homie";
  };

  users.users.dlurak = {
    isNormalUser = true;
    description = "dlurak";
    extraGroups = ["networkmanager" "wheel" "input"];
  };
  users.defaultUserShell = pkgs.zsh;

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
    dev.enable = true;
    hypr.enable = true;
    river.enable = false;
    lsp.enable = true;
    utils.enable = true;
    uwu.enable = true;
    school.enable = true;
    zsh.enable = true;
  };
  programs.manada = let
    defaultConfig = options.programs.manada.config.default;
  in {
    enable = true;
    config =
      defaultConfig
      // {
        data = {
          conversions = {
            yb.zb = "x * 1024";
            zb.eb = "x * 1024";
            eb.pb = "x * 1024";
            pb.tb = "x * 1024";
            tb.gb = "x * 1024";
            gb.mb = "x * 1024";
            mb.kb = "x * 1024";
            kb.b = "x * 1024";
            b.bit = "x * 8";
            bit.yb = "x / (1048576 * 1048576 * 1048576 * 8388608)";
          };
          aliases = {
            yb = ["yotta" "yottabyte"];
            zb = ["zotta" "zottabyte"];
            eb = ["exa" "exabyte"];
            pb = ["peta" "petabyte"];
            tb = ["terra" "terrabyte"];
            gb = ["giga" "gigabyte"];
            mb = ["mega" "megabyte"];
            kb = ["kilo" "kilobyte"];
            b = ["byte"];
          };
        };
      };
  };

  nixModule.enable = true;

  airplay.enable = false;
  firewall = {
    enable = true;
    tcp = [];
    udp = [];
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  services.power-profiles-daemon.enable = true;

  virtualisation.waydroid.enable = false;

  services.fprintd.enable = true;

  mime = {
    enable = true;
    apps = with pkgs; {
      "application/pdf" = zathura;
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
    };
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs ags spicetify-nix;};
    users.dlurak = {...}: {
      imports = [
        ./home.nix
        ./spicetify.nix
      ];
    };
    backupFileExtension = "backup";
  };
}

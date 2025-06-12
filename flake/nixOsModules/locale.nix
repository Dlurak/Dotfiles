{
  lib,
  config,
  ...
}:
{
  options = {
    locale.enable = lib.mkEnableOption "Enable locales, timezone, keymap";

    locale.timeZone = lib.mkOption {
      type = lib.types.str;
      default = "Europe/Berlin";
      description = "The time zone to use.";
    };

    locale.defaultLocale = lib.mkOption {
      type = lib.types.str;
      default = "en_US.UTF-8";
      description = "The default locale to use.";
    };

    locale.extraLocale = lib.mkOption {
      type = lib.types.str;
      default = "de_DE.UTF-8";
      description = "The extra locale to use.";
    };

    locale.keyboard = lib.mkOption {
      type = lib.types.str;
      default = "de";
      description = "The keyboard layout to use.";
    };
  };

  config = lib.mkIf config.locale.enable (
    let
      locale = config.locale;
    in
    {
      time.timeZone = locale.timeZone;

      i18n.defaultLocale = locale.defaultLocale;

      i18n.extraLocaleSettings = {
        LC_ADDRESS = locale.extraLocale;
        LC_IDENTIFICATION = locale.extraLocale;
        LC_MEASUREMENT = locale.extraLocale;
        LC_MONETARY = locale.extraLocale;
        LC_NAME = locale.extraLocale;
        LC_NUMERIC = locale.extraLocale;
        LC_PAPER = locale.extraLocale;
        LC_TELEPHONE = locale.extraLocale;
        LC_TIME = locale.extraLocale;
      };

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = locale.keyboard;
        variant = "nodeadkeys";
      };

      # Configure console keymap
      console.keyMap = locale.keyboard;
    }
  );
}

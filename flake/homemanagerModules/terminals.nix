{
  config,
  lib,
  ...
}: {
  options = {
    homeManagerModules.terminals.enable = lib.mkEnableOption "Enable the terminal module";
  };

  config = lib.mkIf config.homeManagerModules.terminals.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrains Mono";
        size = 13;
      };
      settings = {
        enable_audio_bell = false;
        confirm_os_window_close = 0;
      };
      themeFile = "tokyo_night_night";
    };

    programs.ghostty = {
      enable = true;
      installBatSyntax = false;
      installVimSyntax = false;
      settings = {
        window-decoration = false;
        confirm-close-surface = false;

        ###########
        ## Fonts ##
        ###########
        font-size = 12.5;
        font-family-bold = "JetBrains Mono ExtraBold";
        font-family-italic = "JetBrains Mono Italic";
        font-family-bold-italic = "JetBrains Mono ExtraBold Italic";

        #############
        ## Theming ##
        #############
        theme = "tokyonight_night";
      };
    };
  };
}

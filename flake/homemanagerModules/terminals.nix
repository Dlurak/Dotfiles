{
  config,
  lib,
  ...
}:
{
  options = {
    homeManagerModules.terminals.enable = lib.mkEnableOption "Enable the terminal module";
  };

  config = lib.mkIf config.homeManagerModules.terminals.enable {
    programs.kitty = {
      enable = true;
      settings = {
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        ###########
        ## Fonts ##
        ###########
        font_family = "JetBrains Mono";
        bold_font = "JetBrains Mono ExtraBold";
        italic_font = "JetBrains Mono Italic";
        bold_italic_font = "JetBrains Mono ExtraBold Italic";
        font_size = 13;
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
        font-family = "JetBrains Mono";
        font-family-bold = "JetBrains Mono ExtraBold";
        font-family-italic = "JetBrains Mono Italic";
        font-family-bold-italic = "JetBrains Mono ExtraBold Italic";

        #############
        ## Theming ##
        #############
        theme = "tokyonight_night";

        custom-shader = "~/.config/ghostty/glow.glsl";
      };
    };
  };
}

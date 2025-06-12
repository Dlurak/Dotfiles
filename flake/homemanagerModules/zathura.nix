{
  config,
  lib,
  ...
}:
{
  options = {
    homeManagerModules.zathura.enable = lib.mkEnableOption "Enable zathura (config)";
  };

  config = lib.mkIf config.homeManagerModules.zathura.enable {
    programs.zathura =
      let
        colors = import ../colors.nix;
        rgba = colors.rgba;
      in
      {
        enable = true;
        options = {
          default-fg = rgba.text;
          default-bg = rgba.base;
          completion-bg = rgba.surface0;
          completion-fg = rgba.text;
          completion-highlight-bg = colors.setRgbaOpacity 0.4 rgba.pink;
          completion-highlight-fg = rgba.text;
          completion-group-bg = rgba.surface0;
          completion-group-fg = rgba.blue;
          statusbar-fg = rgba.text;
          statusbar-bg = rgba.surface0;
          notification-bg = rgba.surface0;
          notification-fg = rgba.text;
          notification-error-bg = rgba.surface0;
          notification-error-fg = rgba.red;
          notification-warning-bg = rgba.surface0;
          notification-warning-fg = "rgba(250,227,176,1)";
          inputbar-fg = rgba.text;
          inputbar-bg = rgba.surface0;
          recolor-lightcolor = rgba.base;
          recolor-darkcolor = rgba.text;
          index-fg = rgba.text;
          index-bg = rgba.base;
          index-active-fg = rgba.text;
          index-active-bg = rgba.surface0;
          render-loading-bg = rgba.base;
          render-loading-fg = rgba.text;
          highlight-color = colors.setRgbaOpacity 0.4 rgba.pink;
          highlight-fg = colors.setRgbaOpacity 0.4 rgba.pink;
          highlight-active-color = colors.setRgbaOpacity 0.4 rgba.pink;
          page-padding = 8;
        };
      };
  };
}

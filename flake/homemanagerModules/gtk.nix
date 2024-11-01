{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    homeManagerModules.gtk.enable = lib.mkEnableOption "Enable gtk config";
  };
  config = lib.mkIf config.homeManagerModules.gtk.enable {
    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.google-cursor;
        name = "GoogleDot-Black";
        size = 24;
      };
      theme = {
        package = pkgs.catppuccin-gtk;
        name = "catppuccin-frappe-blue-standard";
      };
      iconTheme = {
        # package = pkgs.fluent-icon-theme;
        # name = "Fluent-dark";
        name = "WhiteSur-dark";
        package = pkgs.whitesur-icon-theme;
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
}

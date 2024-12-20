{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    homeManagerModules.rofi.enable = lib.mkEnableOption "Enable rofi config";
  };
  config = lib.mkIf config.homeManagerModules.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      cycle = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      theme = ../noneNix/rofi-frappe.rasi;
      extraConfig = {
        modi = "run,drun,window";
        show-icons = true;
        drun-display-format = "{icon} {name}";
        location = 0;
        disable-history = false;
        hide-scrollbar = true;
        display-drun = "   Apps ";
        display-run = "   Run ";
        display-window = " 󰕰  Window";
        sidebar-mode = true;
      };
    };
  };
}

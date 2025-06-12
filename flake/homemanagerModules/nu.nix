{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    homeManagerModules.nu.enable = lib.mkEnableOption "Enable nu config";
  };
  config = lib.mkIf config.homeManagerModules.nu.enable {
    programs.nushell = {
      enable = true;
      shellAliases = {
        cd = "z";
        grep = "grep --color=auto";
        cx = "chmod +x";
        window-class = "${pkgs.hyprland}/bin/hyprctl clients -j | jq \".[].class\" -r";
        rename-session = "${pkgs.tmux}/bin/tmux rename-session";
        rename-window = "${pkgs.tmux}/bin/tmux rename-window";
        ":q" = "exit";
      };
      configFile.source = ../noneNix/config.nu;
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

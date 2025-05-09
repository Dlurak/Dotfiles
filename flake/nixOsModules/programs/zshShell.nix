{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.zsh.enable = lib.mkEnableOption "Enable zsh shell";
  };

  config = lib.mkIf config.program.zsh.enable {
    environment.systemPackages = with pkgs; [
      starship
      zoxide
    ];
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
  };
}

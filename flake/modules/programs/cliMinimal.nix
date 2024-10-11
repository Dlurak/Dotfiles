{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    program.cliMinimal.enable = lib.mkEnableOption "Enable minimal cli programs";
  };

  config = lib.mkIf config.program.cliMinimal.enable {
    environment.systemPackages = with pkgs; [
      git
      vim
      neovim
      ripgrep
      tmux
    ];
  };
}

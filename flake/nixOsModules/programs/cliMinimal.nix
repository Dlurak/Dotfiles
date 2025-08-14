{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  options = {
    program.cliMinimal.enable = lib.mkEnableOption "Enable minimal cli programs";
  };

  config = lib.mkIf config.program.cliMinimal.enable {
    environment.systemPackages = with pkgs; [
      git
      vim
      nh
      neovim
      ripgrep
      tmux
      inputs.moxide.packages.${pkgs.system}.default
      (import ../derivations/mox.nix { inherit pkgs inputs; })
      (import ../derivations/habitctl.nix { inherit pkgs; })
      jq
    ];
    programs.nano.enable = false;
  };
}

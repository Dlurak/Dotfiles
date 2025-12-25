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
      gh
      git
      vim
      nh
      neovim
      ripgrep
      tmux
      inputs.moxide.packages.${pkgs.stdenv.hostPlatform.system}.default
      (import ../derivations/mox.nix { inherit pkgs inputs; })
      (pkgs.callPackage ../derivations/habitctl.nix { })
      jq
    ];
    programs.nano.enable = false;
  };
}

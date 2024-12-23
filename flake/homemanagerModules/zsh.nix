{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    homeManagerModules.zsh.enable = lib.mkEnableOption "Enable zsh config";
  };
  config = lib.mkIf config.homeManagerModules.zsh.enable {
    programs.zsh = {
      enable = true;
      shellAliases = {
        cd = "z";
        ls = "${pkgs.coreutils}/bin/ls --color=auto";
        grep = "grep --color=auto";
        bat = "${pkgs.bat}/bin/bat --theme=tokyonight_night";
        cx = "chmod +x";
        window-class = "${pkgs.hyprland}/bin/hyprctl clients -j | jq \".[].class\" -r";
        rename-session = "${pkgs.tmux}/bin/tmux rename-session";
        rename-window = "${pkgs.tmux}/bin/tmux rename-window";
        ":q" = "exit";
        # TODO: Write a shell script using nix
        mox = "/home/dlurak/Dotfiles/scripts/shell/moxide.sh";
      };
      completionInit = "compinit && autoload -Uz compinit";
      initExtra = ''
        ##########
        ## EVAL ##
        ##########
        eval "$(fzf --zsh)"

        ##############
        ## SETTINGS ##
        ##############
        bindkey -v
        bindkey '^n' history-search-forward
        bindkey '^p' history-search-backward

        HISTSIZE=5000
        HISTFILE=~/.zsh_history
        SAVEHIST=$HISTSIZE
        HISTDUP=erease

        setopt appendhistory
        setopt sharehistory
        setopt hist_ignore_space
        setopt hist_ignore_all_dups
        setopt hist_save_no_dups
        setopt hist_ignore_dups
        setopt hist_find_no_dups

        zstyle ':completion:*' list-colors "$\{s.:. LS_COLORS}"

        nitch
      '';
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

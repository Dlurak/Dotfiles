{
  config,
  lib,
  pkgs,
  ...
}:
{
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
        cx = "chmod +x";
        window-class = "${pkgs.hyprland}/bin/hyprctl clients -j | jq \".[].class\" -r";
        rename-session = "${pkgs.tmux}/bin/tmux rename-session";
        rename-window = "${pkgs.tmux}/bin/tmux rename-window";
        rm = "rm -I";
        trackpad = "hyprctl keyword 'device[synps/2-synaptics-touchpad]:enabled'";
      };
      completionInit = "compinit && autoload -Uz compinit";
      initContent = ''
        				##########
        				## EVAL ##
        				##########
        				source <(fzf --zsh)

        				##############
        				## SETTINGS ##
        				##############
        				bindkey -v
        				bindkey -M viins '^n' history-search-forward
        				bindkey -M viins '^p' history-search-backward

        				bindkey -M viins '^e' edit-command-line
        				autoload edit-command-line; zle -N edit-command-line

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

        				${pkgs.fastfetch}/bin/fastfetch
        			'';
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

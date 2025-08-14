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
        trackpad = "hyprctl keyword 'device[synps/2-synaptics-touchpad]:enabled'";
      };
      completionInit = "compinit && autoload -Uz compinit";
      initContent = ''
        ########
         EVAL ##
        ########
        al "$(${pkgs.fzf}/bin/fzf --zsh)"

        ############
         SETTINGS ##
        ############
        ndkey -v
        ndkey -M viins '^n' history-search-forward
        ndkey -M viins '^p' history-search-backward

        ndkey -M viins '^e' edit-command-line
        toload edit-command-line; zle -N edit-command-line

        STSIZE=5000
        STFILE=~/.zsh_history
        VEHIST=$HISTSIZE
        STDUP=erease

        topt appendhistory
        topt sharehistory
        topt hist_ignore_space
        topt hist_ignore_all_dups
        topt hist_save_no_dups
        topt hist_ignore_dups
        topt hist_find_no_dups

        tyle ':completion:*' list-colors "$\{s.:. LS_COLORS}"

        ${pkgs.fastfetch}/bin/fastfetch
      '';
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

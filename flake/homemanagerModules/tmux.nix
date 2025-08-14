{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  options = {
    homeManagerModules.tmux.enable = lib.mkEnableOption "Enable tmux (config)";
  };

  config = lib.mkIf config.homeManagerModules.tmux.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      keyMode = "vi";
      # prefix = "C-f";
      mouse = true;
      terminal = "tmux-256color";
      plugins = [
        pkgs.tmuxPlugins.vim-tmux-navigator
      ];
      extraConfig =
        let
          mox = import ../nixOsModules/derivations/mox.nix { inherit pkgs inputs; };
          muxbar = inputs.muxbar.defaultPackage.${pkgs.system};
          change-session = pkgs.writeShellScriptBin "change-session" ''
            session=$(${pkgs.tmux}/bin/tmux ls -F '#S' | ${pkgs.fzf}/bin/fzf \
            	--layout reverse \
            	--border rounded \
            	--border-label "Tmux Sessions" \
            	--no-scrollbar \
            	--prompt "✨ " \
            	--pointer "👉"
            )

            if [ -n "$session" ]; then
            	${pkgs.tmux}/bin/tmux switch-client -t "$session"
            fi
          '';
        in
        ''
                    set-option -g allow-rename off

                    ############
                    ## PREFIX ##
                    ############

                    unbind C-b
          		  set -g prefix C-f
          		  # This has been changed in a hm-update
          		  bind -N "Send the prefix key through to the application" C-f send-prefix

                    #################
                    ## KEYBINDINGS ##
                    #################

                    # Umlaute are great keys and make it a challange to install this config for any other layout ;)
                    bind-key ö display-popup -B -E -w 40% -h 14 "${mox}/bin/mox"
                    bind-key ä display-popup -B -E -w 40% -h 14 "${change-session}/bin/change-session"

                    bind-key ü choose-session

                    # Splits
                    unbind s
                    bind s split-window -h -c "#{pane_current_path}"

                    unbind v
                    bind v split-window -v -c "#{pane_current_path}"

                    unbind r
                    bind-key r source-file ~/.config/tmux/tmux.conf\; display-message "Config reloaded"

                    # Windows
                    unbind t
                    bind-key t new-window -c "#{pane_current_path}"

                    unbind w
                    bind-key w confirm-before -y -p "kill window #W? (y/n)" kill-window

                    unbind tab
                    bind-key tab last-window

                    unbind c
                    bind-key c send-keys -R \; clear-history \; send-keys enter

                    unbind J
                    bind-key J swap-pane -D
                    unbind K
                    bind-key K swap-pane -U

                    ###################
                    ## DESIGN TWEAKS ##
                    ###################

                    set -ga terminal-overrides ",xterm-256color:Tc"

                    set -g @accent "colour13"
                    # don't do anything when a 'bell' rings
                    set -g visual-activity off
                    set -g visual-bell off
                    set -g visual-silence off
                    setw -g monitor-activity off
                    set -g bell-action none

                    # clock mode
                    setw -g clock-mode-colour colour7
                    setw -g clock-mode-style 24

                    # copy mode
                    setw -g mode-style 'fg=colour7 bg=colour18 bold'

                    # pane borders
                    set -g pane-border-style 'fg=colour4'
                    set -g pane-active-border-style 'fg=#{@accent}'
                    set-option -g status-position top
                    set -g status-left ""
                    set -g status-justify left
                    set -g status-style 'fg=#{@accent}'
                    set -g status-interval 1
                    set -g status-right '#(${muxbar}/bin/muxbar)'
                    # set -g status-right '#(~/SoftwareDevelopment/ricing/muxbar/target/release/muxbar)'
                    set -g status-right-length 150

                    setw -g window-status-current-style 'fg=colour15 bg=#{@accent} bold'
                    setw -g window-status-current-format '#[fg=#{@accent} bg=colour0]#[fg=colour0 bg=#{@accent}]#{?window_zoomed_flag,  ,} #I #W #F #[fg=#{@accent} bg=colour0]'

                    setw -g window-status-style 'fg=#{@accent} dim'
                    setw -g window-status-format ' #I #W #[fg=colour4]#F '

                    setw -g window-status-bell-style 'fg=#{@accent} bg=colour4 bold'

                    # messages
                    set -g message-style 'fg=#{@accent} bg=colour0 bold'

                    set -s escape-time 0
                    set -g detach-on-destroy off
                    set -g renumber-windows on
        '';
    };
  };
}

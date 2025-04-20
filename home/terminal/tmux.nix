{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-ghostty";
    extraConfig = ''
      set -ag terminal-overrides ",$TERM:RGB"

      set -g prefix C-Space
      unbind C-b
      bind-key C-Space send-prefix

      set -g base-index 1              # start indexing windows at 1 instead of 0
      set -g detach-on-destroy off     # don't exit from tmux when closing a session
      set -g escape-time 0             # zero-out escape time delay
      set -g history-limit 1000000     # increase history size (from 2,000)
      set -g renumber-windows on       # renumber all windows when any window is closed
      set -g set-clipboard on          # use system clipboard
      set -g status-position top          # use system clipboard

      unbind %
      # bind | split-window -h
      bind | split-window -h -c "#{pane_current_path}"

      unbind '"'
      bind '-' split-window -v -c "#{pane_current_path}"

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      bind -r m resize-pane -Z

      set -g mouse on
      set -g default-terminal "rxvt-unicode-256color"
      set -g default-terminal "tmux-256color"
      # set -g default-terminal "xterm-kitty-256color"
      set -g default-terminal "xterm-ghostty"

      set-window-option -g mode-keys vi

      bind-key -r f run-shell "tmux neww ~/.local/scripts/tmux-sessionizer"

      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

      unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode when dragging with mouse


      # Configure Online
      set -g @online_icon "ok"
      set -g @offline_icon "nok"

      # status left look and feel
      set -g status-left-length 100
      set -g status-left ""
      set -ga status-left "#{?client_prefix,#{#[bg=#{@thm_red},fg=#{@thm_bg},bold]  #S },#{#[bg=#{@thm_bg},fg=#{@thm_green}]  #S }}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]│"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_maroon}]  #{pane_current_command} "
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
      set -ga status-left "#[bg=#{@thm_bg},fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

      # status right look and feel
      set -g status-right-length 100
      set -g status-right ""
      set -ga status-right "#{?#{e|>=:10,#{battery_percentage}},#{#[bg=#{@thm_red},fg=#{@thm_bg}]},#{#[bg=#{@thm_bg},fg=#{@thm_pink}]}} #{battery_icon} #{battery_percentage} "
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]│"
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_blue}] 󰅐 %H:%M "
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}, none]│"
      set -ga status-right "#[bg=#{@thm_bg},fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
      set -g status-position top
      set -g status-style "bg=#{@thm_bg}"
      set -g status-justify "absolute-centre"

      # pane border look and feel
      setw -g pane-border-status off
      setw -g pane-border-format ""
      setw -g pane-active-border-style "bg=#{@thm_bg},fg=#{@thm_overlay_0}"
      setw -g pane-border-style "bg=#{@thm_bg},fg=#{@thm_surface_0}"
      setw -g pane-border-lines single

      # window look and feel
      set -wg automatic-rename on
      set -g automatic-rename-format "Window"

      set -g window-status-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-style "bg=#{@thm_bg},fg=#{@thm_rosewater}"
      set -g window-status-last-style "bg=#{@thm_bg},fg=#{@thm_peach}"
      set -g window-status-activity-style "bg=#{@thm_red},fg=#{@thm_bg}"
      set -g window-status-bell-style "bg=#{@thm_red},fg=#{@thm_bg},bold"
      set -gF window-status-separator "#[bg=#{@thm_bg},fg=#{@thm_overlay_0}]│"

      set -g window-status-current-format " #I#{?#{!=:#{window_name},Window},: #W,} "
      set -g window-status-current-style "bg=#{@thm_peach},fg=#{@thm_bg},bold"
    '';
    plugins = with pkgs; [
      {
        plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
          pluginName = "tmux-online-status";
          rtpFilePath = "online_status.tmux";
          version = "master";
          src = pkgs.fetchFromGitHub {
            owner = "tmux-plugins";
            repo = "tmux-online-status";
            rev = "82f4fbcaee7ece775f37cf7ed201f9d4beab76b8";
            sha256 = "sha256-vsR/OfcXK2YL4VmdVku3XxGbR5exgnbmlPVIQ2LnWBg=";
          };
          extraConfig = "";
        };
      }

      {
        plugin = pkgs.tmuxPlugins.mkTmuxPlugin {
          pluginName = "tmux-battery";
          rtpFilePath = "battery.tmux";
          version = "master";
          src = pkgs.fetchFromGitHub {
            owner = "tmux-plugins";
            repo = "tmux-battery";
            rev = "48fae59ba4503cf345d25e4e66d79685aa3ceb75";
            sha256 = "sha256-yKMTuRiNnGC3tAbZeWzMEudzhBSJhji8sZh96rFxpb8=";
          };
        };
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_status_background "none"
          set -g @catppuccin_window_status_style "none"
          set -g @catppuccin_pane_status_enabled "off"
          set -g @catppuccin_pane_border_status "off"
        '';
      }

      {
        plugin = tmuxPlugins.vim-tmux-navigator;
        extraConfig = ''

          is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
              | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

          bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h' 'select-pane -L'
          bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j' 'select-pane -D'
          bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k' 'select-pane -U'
          bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l' 'select-pane -R'

          tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'

          if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
          if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
              "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

          # bind-key -n 'C-Space' if-shell "$is_vim" 'send-keys C-Space' 'select-pane -t:.+'

          bind-key -T copy-mode-vi 'C-h' select-pane -L
          bind-key -T copy-mode-vi 'C-j' select-pane -D
          bind-key -T copy-mode-vi 'C-k' select-pane -U
          bind-key -T copy-mode-vi 'C-l' select-pane -R
          bind-key -T copy-mode-vi 'C-\' select-pane -l
        '';
      }
    ];
  };
}

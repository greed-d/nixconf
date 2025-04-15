{ ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      # Nix attribute names cannot contain '$', so we quote it.
      "$schema" = "https://starship.rs/config-schema.json";

      # Using indented strings ''...'' for formats to preserve $vars literally
      # for Starship, preventing Nix interpolation.
      format =
        "$battery$directory$git_branch$git_status$git_state$git_state$line_break$character";
      right_format = "$python $cmd_duration";

      add_newline = true;

      # Language configurations grouped as attribute sets
      c = { disabled = true; };
      cmake = { disabled = true; };
      haskell = { disabled = true; };
      ruby = { disabled = true; };
      rust = { disabled = true; };
      perl = { disabled = true; };
      package = { disabled = true; };
      lua = { disabled = true; };
      nodejs = { disabled = true; };
      java = { disabled = true; };
      golang = { disabled = true; };

      palette = "catppuccin_mocha";

      palettes = {
        catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };

      line_break = { disabled = false; };

      directory = { fish_style_pwd_dir_length = 1; };

      character = {
        success_symbol = "[➜](green bold)";
        error_symbol = "[ ](red)";
        vicmd_symbol = "[ ](yellow)";
      };

      git_branch = {
        # format = "[[\\\\( $symbol$branch](rosewater) | ](text)";
        symbol = " ";
      };

      git_status = {
        # format = ''$all_status$ahead_behind)"'';
        conflicted = "=";
        ahead = "[⇡\${count} ](green)";
        behind = "⇣\${count} ";
        diverged = "[⇕⇡\${ahead_count} ⇣\${behind_count} ](teal)";
        up_to_date = "[󰄸 ](bold green)";
        untracked = "[?\${count} ](maroon)";
        stashed = "[ 󰏖 ](bold green)";
        modified = "[!\${count} ](yellow)";
        staged = "[+\${count} ](green)";
        renamed = "[»\${count} ](peach)";
        deleted = "[ \${count} ](bold red)";
      };

      git_commit = {
        # Use ''...'' for format string with $vars
        format = "[\\\\($hash\\\\)]($style) [\\\\($tag\\\\)]($style)";
        style = "green";
      };

      # This structure was converted in the previous request
      git_state = {
        rebase = "REBASING";
        merge = "MERGING";
        revert = "REVERTING";
        cherry_pick = "CHERRY-PICKING";
        bisect = "BISECTING";
        am = "AM";
        am_or_rebase = "AM/REBASE";
        style = "yellow";
        format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
      };

      cmd_duration = {
        min_time = 10;
        # Use ''...'' for format string with $vars
        format = "󰥔 [$duration](bold purple)";
        show_milliseconds = true;
      };

      # python = {
      #   symbol = " ";
      #   # Use indented strings ''...'' to prevent Nix interpolation
      #   format =
      #     "\\[[${symbol}${pyenv_prefix}(${version})(\\($virtualenv\\))]($style)\\]";
      # };
    };
  };
}

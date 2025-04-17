{pkgs, ...}: let
  TokyoNight = pkgs.fetchFromGitHub {
    owner = "vitallium";
    repo = "tokyonight-fish";
    rev = "de768651cc7cb95bcbd7b72f28f1ab45d8afae3b";
    hash = "sha256-be5gqCl7yfb0zm43ew8YB7BZ37o5bFGE/YXcLUIoIrA=";
  };
in {
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons --git --group-directories-first";
      la = "eza -a --icons --git --group-directories-first";
      lf = "yazi";
      lt = "eza -lah --color -T -L 2 --git --icons --group-directories-first --no-user";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";
      e = "thunar";
      x = "exit";
      lg = "lazygit";
      nvd = "neovide";

      dot = "tmux-sessionizer ~/.dotfiles";
      tns = "tmux new -s";
      tas = "tmux attach -t";
      tls = "tmux list-sessions";
      tds = "tmux detach";
    };
    interactiveShellInit = ''
      function __history_previous_command
          switch (commandline -t)
              case "!"
                  commandline -t $history[1]
                  commandline -f repaint
              case "*"
                  commandline -i !
          end
      end

      function __history_previous_command_arguments
          switch (commandline -t)
              case "!"
                  commandline -t ""
                  commandline -f history-token-search-backward
              case "*"
                  commandline -i '$'
          end
      end
      bind ! __history_previous_command
      bind '$' __history_previous_command_arguments

      bind \cf tmux-sessionizer

    '';

    plugins = [
      #   {
      #   name = "bangbang";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "BrewingWeasel";
      #     repo = "fishbang";
      #     rev = "f8d2721ac5508dbda54a666ebf12f1492c478277";
      #     sha256 = "1lcq6nvv6qxqm7rgshhd9c83hbzjaihxdj9m1lsgnvp8fnvn6ysl";
      #   };
      # }
    ];
  };
  xdg.configFile."fish/themes/TokyoNight Night.theme".source = "${TokyoNight}/themes/TokyoNight Night.theme";
}

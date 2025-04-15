{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons --git --group-directories-first";
      la = "eza -a --icons --git --group-directories-first";
      lf = "yazi";
      lt =
        "eza -lah --color -T -L 2 --git --icons --group-directories-first --no-user";

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

    plugins = [{
      name = "bangbang";
      src = pkgs.fetchFromGitHub {
        owner = "BrewingWeasel";
        repo = "fishbang";
        rev = "f8d2721ac5508dbda54a666ebf12f1492c478277";
        sha256 = "1lcq6nvv6qxqm7rgshhd9c83hbzjaihxdj9m1lsgnvp8fnvn6ysl";
      };
    }];

  };
}

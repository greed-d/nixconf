{...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "tokyonight_night";
      font-size = 13;
      term = "xterm-ghostty";
      window-padding-x = 7;
      window-padding-y = 7;
      font-family = "JetBrainsMono Nerd Font";
      window-decoration = false;
    };
    enableFishIntegration = true;
  };
}

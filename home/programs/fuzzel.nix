{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        anchor = "left";
        prompt = ">> ";
        layer = "overlay";
        x-margin = 10;
        y-margin = 10;
        lines = 23;
        width = 30;
        tabs = 8;
        placeholder = "Search";
        icon-theme = "Papirus-Dark";
        font = "JetBrainsMono Nerd Font-8";
        line-height = 20;
      };
      colors = {
        background = "16161eff";
        text = "c0caf5ff";
        match = "2ac3deff";
        # text = "cdd6f4ff";
        selection = "343a55ff";
        selection-match = "2ac3deff";
        selection-text = "c0caf5ff";
        border = "45475aff";
      };

      border = {
        width = 2;
        radius = 10;
      };
    };
  };
}

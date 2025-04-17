{
  pkgs,
  lib,
  ...
}: {
  imports = [./plugins ./lsp ./core];
  config.vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
    };
    highlight = {
      FloatBorder = {
        fg = "#45475A";
        bg = null;
      };
      SnacksPickerTitle = {
        bg = "#7aa2f7";
        fg = "#1f2335";
      };
      SnacksPickerPreview = {bg = "#1a1b26";};
      SnacksPickerList = {bg = "#1a1b26";};
      SnacksPickerListTitle = {
        bg = "#9ece6a";
        fg = "#1f2335";
      };
      SnacksPickerInputTitle = {
        bg = "#f7768e";
        fg = "#1f2335";
      };
      SnacksPickerInputBorder = {
        bg = "#1a1b26";
        fg = "#45475a";
      };
      SnacksPickerInputSearch = {
        bg = "#f7768e";
        fg = "#1f2335";
      };
      SnacksPickerInput = {bg = "#1a1b26";};
    };
  };
}

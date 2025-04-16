{ pkgs, lib, ... }: {
  imports = [ ];
  programs.nvf = {
    enable = true;
    settings = {
      vim.theme = {
        enable = true;
        name = "tokyonight";
        style = "night";
      };
    };
  };
}

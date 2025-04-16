{ pkgs, lib, ... }: {
  imports = [ ./plugins ./lsp ];
  config.vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
    };
  };
}

{ pkgs, lib, ... }: {
  imports = [ ./plugins ./lsp ./core ];
  config.vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
    };
  };
}

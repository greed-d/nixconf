{ pkgs, lib, ... }: {
  imports = [ ./plugins ];
  config.vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
    };
  };
}

{ lib, pkgs, configs, ... }: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 20;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;

    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
    };
    iconTheme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Dark";
    };

  };
}

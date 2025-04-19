{pkgs, ...}: {
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
      # package = "${pkgs.callPackage ./suru-gtk.nix {inherit pkgs;}}";
      package = pkgs.tela-icon-theme;
      name = "Tela-icon-theme";
    };
  };
}

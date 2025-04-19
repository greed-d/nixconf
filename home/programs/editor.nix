{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    uv

    (pkgs.python313.withPackages (ppkgs: [
      ppkgs.requests
    ]))
  ];
}

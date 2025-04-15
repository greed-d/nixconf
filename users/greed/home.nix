{ pkgs, config, ... }: {
  # imports = [ ../../home/core.nix ./programs ./niri ];
  imports = [
    ../../home/core.nix
    ../../home/programs
    ../../home/niri
    ../../home/terminal
    ../../home/misc/swaync.nix
  ];

  programs.git = {
    enable = true;
    userName = "greed-d";
    userEmail = "deekshit.bti@gmail.com";
  };

}

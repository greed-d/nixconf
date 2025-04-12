{ pkgs, ... } : {
  imports = [
    ../../home/core.nix
    ../../home/programs
  ];

  programs.git = {
    userName = "greed-d";
    userEmail = "deekshit.bti@gmail.com";
  };
}

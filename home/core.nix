{ username, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
  };
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

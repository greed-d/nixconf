{ username, config, ... }: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
  };
  home.stateVersion = "24.11";
  home.sessionPath = [ "/home/greed/.local/scripts" ];
  programs.home-manager.enable = true;
}

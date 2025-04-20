{pkgs, ...}: let
  waybarPrSource = pkgs.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "9556bdabda987acb8bb8959cbfbe1e6f157cccf2";
    sha256 = "sha256-LpPkmAUXJ1ZExnf4SEs/g9juTmS1s2mEvC5hi91/MHE=";
  };

  myWaybarFromPR =
    pkgs.waybar.overrideAttrs (oldAttrs: {src = waybarPrSource;});
in {
  imports = [./simple];
  programs.waybar = {
    package = myWaybarFromPR;
    enable = true;
  };
}

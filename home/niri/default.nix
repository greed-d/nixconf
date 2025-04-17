{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./binds.nix
    ./config.nix
    ./rules.nix
    ./animations.nix
    ./hypridle.nix
    ./hyprlock.nix
  ];

  home.packages = with pkgs; [xwayland-satellite];
}

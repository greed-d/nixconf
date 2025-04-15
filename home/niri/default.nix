{ inputs, pkgs, ... }: {
  imports = [
    inputs.niri.homeModules.niri
    ./binds.nix
    ./config.nix
    ./rules.nix
    ./animations.nix
  ];
}

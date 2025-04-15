{ ... }: {
  imports = [
    #Enable starship
    ./starship.nix # This isn't working
    ./ghostty.nix

    ./bash.nix
    ./fish.nix
    ./zoxide.nix
  ];
}

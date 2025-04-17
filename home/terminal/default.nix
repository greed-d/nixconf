{...}: {
  imports = [
    #Enable starship
    ./starship.nix # This isn't working
    ./ghostty.nix
    ./lazygit.nix
    ./bash.nix
    ./fish.nix
    ./zoxide.nix
    ./tmux.nix
  ];
}

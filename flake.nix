{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = { url = "github:sodiboo/niri-flake"; };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      bael = let
        username = "greed";
        specialArgs = { inherit username; };
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/bael
          # ./configuration.nix
          # ./users/${username}/nixos.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} =
              import ./users/${username}/home.nix;
          }
        ];

      };

      #      bael = nixpkgs.lib.nixosSystem {
      #        system = "x86_64-linux";
      #        specialArgs = { inherit inputs; };
      #        modules = [
      #        ./configuration.nix
      #
      # home-manager.nixosModules.home-manager 
      # {
      #   home-manager.useGlobalPkgs = true;
      #   home-manager.useUserPackages = true;
      #
      #   home-manager.users.greed = import ./home.nix;
      #   }
      #        ];
      #      };
    };
  };
}

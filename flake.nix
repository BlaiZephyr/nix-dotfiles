{
  description = "melon's flakes!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
      nixosConfigurations = {
        melonix = nixpkgs.lib.nixosSystem {
          modules = [
            ./nixosConfig/melonix/configuration.nix
            home-manager.nixosModules.home-manager
            {
              imports = [ ./nixosConfig/melonix/default.nix ];
            }
          ];
        };
      };
    };
}


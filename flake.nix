{
  description = "melon's flakes!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, self, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system} {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;
      nixosConfigurations = {
        melonix = nixpkgs.lib.nixosSystem {
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.melonix = {
                imports = [ ./modules/home/default.nix ];
              };
            }
          ];
        };
      };
    };
}


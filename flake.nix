{
  description = "melon's flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim.url = "github:fred-drake/neovim";
  };

  # Output configuration
  outputs = {
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    mkNeovimPackages = pkgs: neovimPkgs: let
      mkNeovimAlias = name: pkg:
        pkgs.runCommand "neovim-${name}" {} ''
          mkdir -p $out/bin
          ln -s ${pkg}/bin/nvim $out/bin/nvim-${name}
        '';
    in
      builtins.mapAttrs mkNeovimAlias neovimPkgs;
  in
    inputs.flake-utils.lib.eachDefaultSystem (system: {})
    // {
      nixosConfigurations = {
        melonix = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
          specialArgs = {inherit inputs;};
          modules = [
            inputs.nur.nixosModules.nur
            ./nixosConfig/melonix/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.melonix.imports = [
                  ./nixosConfig/home
                  ({pkgs, ...}: {
                    home.packages =
                      (builtins.attrValues (mkNeovimPackages pkgs inputs.neovim.packages.${pkgs.system}))
                      ++ [inputs.neovim.packages.${pkgs.system}.default];
                  })
                ];
                extraSpecialArgs = {inherit inputs;};
              };
            }
          ];
        };
      };
    };
}

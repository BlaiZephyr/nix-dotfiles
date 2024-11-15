{
  description = "melon's flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.05";
    nixos-hardware.url = "github:nixos/nixos-hardware";

    stylix.url = "github:danth/stylix";
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

    hyprland.url = "github:hyprwm/Hyprland";
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix-overlay.url = "github:helix-editor/helix";
  };

  outputs = {
    home-manager,
    nixpkgs,
    nixpkgs-stable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs-stable = import nixpkgs-stable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      melonix = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit pkgs;
          inherit pkgs-stable;
          inherit inputs;
        };

        modules = [
          ./nixosConfig/melonix/configuration.nix
        ];
      };
      cosmec = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit pkgs;
          inherit pkgs-stable;
          inherit inputs;
        };

        modules = [
          ./nixosConfig/cosmec/configuration.nix
        ];
      };
    };
  };
}

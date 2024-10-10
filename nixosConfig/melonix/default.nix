{ lib', ... }:
{
  flake.nixosConfigurations = lib'.mkHost {
    hostName = "melonix";
    modules = [
      ../common/social.nix
      ../common/gaming.nix
      ../common/terminal.nix
      ../common/mediacreation.nix
      ../common/home.nix
      ../common/vscode.nix
      ./configuration.nix
      ../common/nvim.nix
    ];
  };
}

{inputs, ...}: {
  imports = [
    ./boot.nix
    ./fonts.nix
    ./greetd.nix
    ./hardware.nix
    ./network.nix
    ./nfs.nix
    ./nh.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./starfish.nix
    ./steam.nix
    ./stylix.nix
    ./syncthing.nix
    ./system.nix
    ./user.nix
    ./virtualisation.nix
    ./xdg.nix
    ./xserver.nix
    inputs.stylix.nixosModules.stylix
  ];
}

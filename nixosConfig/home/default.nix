{pkgs, ...}: {
  imports = [
    ./terminal.nix
    ./home.nix
  ];

  home.packages = with pkgs; [
    krita
  ];
}

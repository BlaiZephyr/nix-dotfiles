{pkgs, ...}: {
  imports = [
    ./terminal.nix
    ./home.nix
    ./work.nix
  ];

  home.packages = with pkgs; [
    krita
  ];
}

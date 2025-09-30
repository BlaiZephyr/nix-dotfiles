{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    atop
    bottom
    dua
    fd
    gping
    lunarvim
    luarocks
    mission-center
    resources
    ncdu
    gdu
    ugrep
    waypaper
  ];
}

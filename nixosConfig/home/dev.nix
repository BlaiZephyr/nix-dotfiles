{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    cmake
  ];
}

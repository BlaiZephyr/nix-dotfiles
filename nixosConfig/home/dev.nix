{pkgs, ...}: {
  home.packages = with pkgs; [
    #core tools
    vscode-fhs
    libsForQt5.full

    git
    cmake

    nixpkgs-fmt
  ];
}

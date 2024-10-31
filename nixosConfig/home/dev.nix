{pkgs, ...}: {
  home.packages = with pkgs; [
    #core tools
    vscode-fhs
    libsForQt5.full

    nixpkgs-review
    gh
    git
    cmake

    nixpkgs-fmt
  ];
}

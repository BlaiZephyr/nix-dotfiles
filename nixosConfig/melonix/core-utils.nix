{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    flameshot
    wineWow64Packages.full
    xfce.thunar
    xfce.thunar-volman
    nix-output-monitor
    nvd
    clinfo
    devenv
    #games
    prismlauncher
    vesktop

    #kdenlive
    kdenlive

    #lsp + formatter
    nixd
    alejandra
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.nix-ld.enable = true;
  # for the zed editor so LSP servers work.
  programs.nix-ld.libraries = [];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 12d --keep 3";
    flake = "/home/melonix/.dotfiles/";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "DroidSansMono"
      ];
    })
  ];

  services.printing.enable = true;
}

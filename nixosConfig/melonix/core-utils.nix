{
  pkgs,
  inputs,
  ...
}: {
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

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

  environment.systemPackages = with pkgs; [
    #e-mail
    thunderbird

    wineWowPackages.stable
    nix-output-monitor
    nvd
    clinfo
    devenv
    #games
    prismlauncher

    #kdenlive
    kdenlive
  ];
}

{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    flameshot
    vscode
    wineWow64Packages.full
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}

{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
    handbrake
    yt-dlp
    android-studio
    android-studio-tools
    android-tools
  ];
}

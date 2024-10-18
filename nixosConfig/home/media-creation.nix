{pkgs, ...}: {
  home.packages = with pkgs; [
    krita
    imgcat
    yt-dlp
    ffmpeg
    obs-studio
    audacity
  ];
}

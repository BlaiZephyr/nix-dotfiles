{pkgs, ...}: {
  home.packages = with pkgs; [
    #video player
    vlc
    imgcat
    yt-dlp
    ffmpeg
    obs-studio
    audacity
  ];
}

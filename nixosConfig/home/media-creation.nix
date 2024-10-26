{pkgs, ...}: {
  home.packages = with pkgs; [
    #video player
    vlc
    krita
    imgcat
    yt-dlp
    ffmpeg
    obs-studio
    audacity
    davinci-resolve
  ];
}

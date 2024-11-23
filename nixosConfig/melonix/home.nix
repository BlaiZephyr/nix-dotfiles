{pkgs, ...}: {
  imports = [
    ../../modules/home
  ];

  hm = {
    discord.enable = true;
    git.enable = true;
    helix.enable = true;
    kitty.enable = true;
    nh.enable = true;
    obs-studio.enable = true;
    plasma-manager.enable = false;
    stylix.enable = true;
    shell.enable = true; #TODO: seperate bash from the rest as a standalone
    code.enable = true;
    rofi.enable = true;
  };

  home.packages = with pkgs; [
    #GENERAL AUDIO/VIDEO
    vlc
    imgcat
    yt-dlp
    ffmpeg
    audacity

    libreoffice
  ];
  home.stateVersion = "24.11";
}

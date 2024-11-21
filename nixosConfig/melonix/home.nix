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
    plasma-manager.enable = true;
    stylix.enable = true;
    shell.enable = true; #TODO: seperate bash from the rest as a standalone
    code.enable = true;
    rofi.enable = true;
    waybar.enable = false;
    #   hyprland.enable = true; #stop seperating things you moronic askdjnalsdnksal
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

{pkgs, ...}: {
  imports = [
    ../../modules/home
  ];

  hm = {
    discord.enable = true;
    git.enable = true;
    helix.enable = false;
    kitty.enable = true;
    nh.enable = true;
    obs-studio.enable = true;
    plasma-manager.enable = true;
    stylix.enable = true;
    shell.enable = true; # TODO: seperate bash from the rest as a standalone
    code.enable = true;
    rofi.enable = true;
    neovim.enable = true;
    firefox.enable = true;
  };

  home.packages = with pkgs; [
    #GAMING
    (wineWowPackages.full.override {
      wineRelease = "staging";
      mingwSupport = true;
    })
    winetricks

    #GENERAL AUDIO/VIDEO
    vlc
    imgcat
    yt-dlp
    ffmpeg
    audacity
    kdenlive
    libreoffice
  ];
  home.stateVersion = "24.11";
}

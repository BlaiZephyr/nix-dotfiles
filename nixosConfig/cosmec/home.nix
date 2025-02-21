{ pkgs, ... }:
{
  imports = [
    ../../modules/home
  ];

  hm = {
    # discord.enable = true;
    git.enable = true;
    helix.enable = false;
    neovim.enable = true;
    kitty.enable = true;
    nh.enable = true;
    shell.enable = true;
    code.enable = true;
  };

  home.packages = with pkgs; [
    ffmpeg
    yt-dlp
    imgcat
    vlc
    libreoffice
  ];

  home.stateVersion = "24.11";
}
